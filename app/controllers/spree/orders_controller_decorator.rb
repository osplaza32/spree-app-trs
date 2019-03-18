module OrdersControllerExtensions
  include CountryFromIp

  def update
    return super unless params.has_key?(:checkout) && request_from_international_customer?

    @order_line = @order.line_items.map do |item|
      variant_text = item.variant.options_text ? ", VARIANTE: #{item.variant.options_text}" : ''
      "- #{item.variant.product.name}, SKU: #{item.variant.sku}, Cantidad: #{item.quantity}#{variant_text}\n"
    end

    @international_order_form = InternationalOrderForm.new
    render 'spree/internationals/newform'
  end
end

Spree::OrdersController.class_eval do
  prepend OrdersControllerExtensions
end
