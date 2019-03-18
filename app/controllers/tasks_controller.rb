# Clase de pedido
class TasksController < Spree::StoreController
  before_action :admin?
  layout Spree::Config['layout']

  # Search Products by SKU
  def sku_search
    @q = params[:q]

    return unless @q

    begin
      @product = Spree::Variant.find_by(sku: @q).product
    rescue
      @product = nil
    end
  end

  def users_database
    @users = Spree::User.all
  end

  private

  def admin?
    redirect_to root_path unless spree_user_signed_in? && spree_current_user.admin?
  end
end
