# This migration comes from spree_tbk_webpay (originally 20150406160032)
class AddAcceptedToSpreePayments < ActiveRecord::Migration
  def change
    add_column :spree_payments, :accepted, :boolean
  end
end