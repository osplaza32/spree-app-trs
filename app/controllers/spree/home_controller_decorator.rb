Spree::HomeController.class_eval do
   include CountryFromIp
    def index
      if Rails.env.production? || Rails.env.staging?
        redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
      end
      @request_from_international_customer = request_from_international_customer?
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      @categories = @taxonomies.first.taxons.where(parent_id: 1)

      # Specific categories
      @powerparts = @categories.find_by(id: 39)
      @vestuario = @categories.find_by(id: 18)
      @accesorios = @categories.find_by(id: 21)
      @offroad = @categories.find_by(id: 25)
      @kids = @categories.find_by(id: 23)
      @street = @categories.find_by(id: 44)
    end
  end
