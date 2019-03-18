# Clase reguladora de mails a international
class InternationalOrderForm < MailForm::Base
  attribute :nombre, validate: true
  attribute :apellido,  validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :pais, presence: true
  attribute :pedido, presence: true

  def headers
    {
      subject: 'Formulario Compra internacional KTM-Shop',
      to: 'ventas@ktm-shop.cl',
      bcc: 'webmaster@santiagolab.cl',
      from: %("#{nombre} #{apellido}" <#{email}>)
    }
  end
end
