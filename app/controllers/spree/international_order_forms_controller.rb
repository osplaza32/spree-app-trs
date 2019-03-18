module Spree
  class InternationalOrderFormsController < Spree::StoreController
    include CountryFromIp

    def create
      @international_order_form = InternationalOrderForm.new(params[:international_order_form])
      @international_order_form.request = request
      if @international_order_form.deliver
        flash[:custom] = 'hemos recibido su pedido y nos contactaremos pronto con ud.'
        render 'pages/confirm_international_order'
      else
        flash[:notice] = "Se detecto un error por favor intente de nuevo"
        render 'spree/internationals/newform'
      end
    end
  end
end
