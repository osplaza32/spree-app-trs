# Clases del formulario de contcto con sus atributos y metodo correspondiente
class ContactMailer < ApplicationMailer
  default from: 'no-reply@ktm-shop.cl'

  def notification_email(user_email)
    mail(to: user_email, subject: 'Formulario recibido')
  end
end
