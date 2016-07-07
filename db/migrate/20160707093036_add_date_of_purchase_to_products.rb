class AddDateOfPurchaseToProducts < ActiveRecord::Migration
  def change
    add_column :products, :date_of_purchase, :date
  end
end
