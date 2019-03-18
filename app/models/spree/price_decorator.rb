Spree::Price.class_eval do
  def maximum_amount
    BigDecimal '999_999_999.99'
  end
end
