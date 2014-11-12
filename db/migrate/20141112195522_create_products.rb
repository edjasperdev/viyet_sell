class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :type
      t.boolean :suggested_price
      t.timestamps
    end
  end
end
