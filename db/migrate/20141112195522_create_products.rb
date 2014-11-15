class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :furniture_type
      t.integer :price
      t.integer :original_price
      t.boolean :suggested_price
      t.timestamps
    end
  end
end
