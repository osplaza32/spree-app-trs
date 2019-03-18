# Clase que crea la clase para el envio de mail
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@ktm-shop.cl'
  layout 'mailer'
end
