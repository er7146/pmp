class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    
      t.string :name
      t.string :image_filename
      t.float :price_per_item

      t.datetime
    end
  end
end
def down
    drop_table :products
  end