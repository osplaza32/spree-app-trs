module Spree
  class DefaultContactsController < Spree::StoreController
    def new
      @contact = DefaultContact.new
    end

    def create
      @contact = DefaultContact.new(params[:contact])
      @contact.request = request
      if @contact.deliver
        flash.now[:notice] = 'Su mensaje ha sido enviado correctamente.'
        render :new
      else
        flash.now[:error] = 'Su mensaje no pudo ser enviado, intente más tarde.'
        render :new
      end
    end
  end
end
