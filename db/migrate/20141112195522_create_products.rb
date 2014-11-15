class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :furniture_type
      t.integer :price
      t.integer :original_price
      t.boolean :suggested_price
      t.text :image_url, default: "https://pbs.twimg.com/profile_images/457585226072338432/869gzRdR_400x400.jpeg"
      t.timestamps
    end
  end
end
