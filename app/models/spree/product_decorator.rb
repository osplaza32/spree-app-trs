Spree::Product.class_eval do
  add_search_scope :in_taxon do |taxon|
    includes(:classifications)
      .where('spree_products_taxons.taxon_id' => taxon.self_and_descendants.pluck(:id))
      .order('spree_products_taxons.position ASC').uniq
  end
  # Determines if the product is new based on Date Range
  def new?
    available_on + 1.month >= Time.zone.today ? true : false
  rescue
    false
  end

  # Return discount percent value based on taxonomy
  def discount_value
    return '20' if taxons.find_by(id: 126) # Taxon 20% Descuento
    return '25' if taxons.find_by(id: 128) # Taxon 25% Descuento
    return '30' if taxons.find_by(id: 127) # Taxon 30% Descuento
    return '33' if taxons.find_by(id: 134) # Taxon 33% Descuento
  end
end
