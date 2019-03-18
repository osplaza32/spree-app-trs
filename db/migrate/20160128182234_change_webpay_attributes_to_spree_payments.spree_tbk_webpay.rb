# This migration comes from spree_tbk_webpay (originally 20150620101433)
class ChangeWebpayAttributesToSpreePayments < ActiveRecord::Migration
  def change
    add_column :spree_payments, :webpay_params, :text
  end
end
