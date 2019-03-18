# Controlador para mostrar paginas varias
class PagesController < Spree::StoreController
  layout Spree::Config[:layout]

  def sales
    @taxonomies = Spree::Taxonomy.all
    # Select Sales Taxon
    begin
      @sales_taxon = Spree::Taxon.find(118)
      @products = Spree::Product.in_taxons(@sales_taxon)
    rescue
      @products = nil
    end
  end

  def questions
    @taxonomies = Spree::Taxonomy.all
  end

  def availables
    @products = Spree::Product.available.uniq.all

    respond_to do |format|
      format.csv
    end
  end

  def sku_search
    @q = params[:q]

    return unless @q

    begin
      @product = Spree::Variant.find_by(sku: @q).product
    rescue
      @product = nil
    end
  end

  # def ultimos
  #   @products = Spree::Product.order(created_at: :desc)
  #
  #   respond_to do |format|
  #     format.csv
  #   end
  # end
  #
  # def detalle_venta
  #   @orders = Spree::Order.complete.all
  #   @variants = Spree::Variant.all
  #
  #   respond_to do |format|
  #     format.csv
  #   end
  # end
end
