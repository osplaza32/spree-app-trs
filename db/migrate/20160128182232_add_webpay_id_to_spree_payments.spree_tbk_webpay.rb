# This migration comes from spree_tbk_webpay (originally 20140408175830)
class AddWebpayIdToSpreePayments < ActiveRecord::Migration
  def change
    add_column :spree_payments, :webpay_trx_id, :string
  end
end
