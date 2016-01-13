class RemoveAmountFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :amount, :decimal
  end
end
