class CreateBikeTags < ActiveRecord::Migration
  def change
    create_table :bike_tags do |t|
      t.references :bike, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
