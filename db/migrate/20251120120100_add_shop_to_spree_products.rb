class AddShopToSpreeProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_products, :shop, foreign_key: { to_table: :shops }, index: true
  end
end
