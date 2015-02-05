class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :po_num
      t.integer :product_id
      t.integer :quantity
      t.text    :comments
      t.string  :image_upload
      t.float   :total_price

      t.datetime
    end
  end
end

  