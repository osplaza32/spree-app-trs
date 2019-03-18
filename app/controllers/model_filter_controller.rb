# Clase del filtro de los productos
class ModelFilterController < Spree::StoreController
  def index
    @mx = find_childs_by_id(107)
    @enduro = find_childs_by_id(108)
    @travel = find_childs_by_id(109)
    @supermoto = find_childs_by_id(110)
    @supersports = find_childs_by_id(111)
    @naked = find_childs_by_id(112)
    @sportstourer = find_childs_by_id(113)
    # @freeride = find_childs_by_permalink('free-ride')
    @all_path = '/t/repuesto-para/todas'
  end

  private

  # Get child taxons based on parent permalink
  def find_childs_by_permalink(permalink)
    parent_id = Spree::Taxon.where(permalink: 'repuesto-para/' + permalink).first.id
    if Spree::Taxon.where(parent_id: parent_id).any?
      Spree::Taxon.where(parent_id: parent_id)
    else
      false
    end
  rescue
    false
  end

  def find_childs_by_id(taxon_id)
    childs = Spree::Taxon.where(parent_id: taxon_id)

    if childs.any?
      childs
    else
      false
    end
  end
end
