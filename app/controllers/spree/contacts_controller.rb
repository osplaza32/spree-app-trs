module Spree
  class ContactsController < Spree::StoreController
    def new
      @contact = Contact.new
    end

    def create
      @contact = Contact.new(params[:contact])
      @contact.request = request
      user_email = params[:contact][:email]

      if @contact.deliver
        ContactMailer.notification_email(user_email).deliver
        flash.now[:notice] = 'Su mensaje ha sido enviado correctamente.'
        render :new
      else
        flash.now[:error] = 'Su mensaje no pudo ser enviado, intente más tarde.'
        render :new
      end
    end

  end
end
