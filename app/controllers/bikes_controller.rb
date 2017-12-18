class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  # GET /bikes
  # GET /bikes.json
  def index
    @bikes = Bike.all
  end

  def search
    ids = params[:tag_id].map(&:to_i)
    srch = Tag.where(id: ids).pluck(:name)
    bikes_with_tags = Bike.uniq
                    .joins(:bike_tags)
                    .map{ |e| {bike_name: e.name, url: e.manufacturer_url, tags: e.tags.pluck(:name)} }
    bikes_with_tags = bikes_with_tags.map {|bikes| bikes[:matching] = (bikes[:tags] & srch) }                
    bikes_with_tags = bikes_with_tags.map {|bikes| bikes[:score] = (bikes[:matching].size)/1.0*(srch.size) }
    @bikes = bikes_with_tags.sort_by {|e| e[:score]}.reverse
  end

  # GET /bikes/1
  # GET /bikes/1.json
  def show
  end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit
  end

  # POST /bikes
  # POST /bikes.json
  def create
    @bike = Bike.new(bike_params)

    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render :show, status: :created, location: @bike }
      else
        format.html { render :new }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bikes/1
  # PATCH/PUT /bikes/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Bike was successfully updated.' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikes/1
  # DELETE /bikes/1.json
  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to bikes_url, notice: 'Bike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Bike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_params
      params.require(:bike).permit(:name, :manufacturer_url, :all_tags)
    end
end
