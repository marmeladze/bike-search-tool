class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufacturer_url
      t.text :features, array: true, default: []

      t.timestamps null: false
    end
  end
end
