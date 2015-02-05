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

    @order.user_id         = params["user_id"]
    @order.po_num          = params["po_num"]
    @order.product_id      = params["product_id"]
    @order.quantity        = params["quantity"]
    @stamp.stamp_type      = params["stamp_type"]
    @order.color_type      = params["color_type"]
    @order.copy_align      = params["copy_align"]
    @order.upload_file     = params["upload_file"]
    @order.size            = params["size"]
    @order.typestyle       = params["typestyle"]
    @order.line_1          = params["line_1"]
    @order.line_2          = params["line_2"]
    @order.line_3          = params["line_3"]
    @order.line_4          = params["line_4"]
    @order.line_5          = params["line_5"]
    @order.line_6          = params["line_6"]
    @order.line_7          = params["line_7"]
    @order.comments        = params["comments"]