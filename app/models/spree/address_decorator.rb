Spree::Address.class_eval do
  validates :rut, format: {
    with: /\A(\d{1,3})(\d{1,3})(\d{1,3})\-(k|\d{1})\Z/i,
    message: 'no válido.'
  }
end
