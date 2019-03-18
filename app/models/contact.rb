# clases de contacto
class Contact < MailForm::Base
  attribute :nombre, validate: true
  attribute :apellido,  validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :telefono
  attribute :mensaje
  attribute :id_compra
  attribute :id_despacho
  attribute :asunto
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  # asunto = :asunto.to_s

  def headers
    {
      subject: 'Formulario de contacto KTM-Shop',
      to: 'rodrigo@ktm-shop.cl',
      bcc: 'webmaster@santiagolab.cl',
      from: %("#{nombre} #{apellido}" <#{email}>)
    }
  end
end
