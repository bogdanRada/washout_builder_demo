class AddDateOfPurchaseToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :date_of_purchase, :date
  end
end
