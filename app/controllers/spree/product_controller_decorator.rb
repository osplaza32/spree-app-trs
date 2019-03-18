module Spree
  ProductsController < Spree::StoreController
    def index
      @searcher = build_searcher(params.merge(include_images: true))
      #@products = @searcher.retrieve_products
      @products = Spree::Product.in_taxon(@taxon)
      #@taxonomies = Spree::Taxonomy.includes(root: :root)
    end

end
