# Clase que controla el informe
# rubocop:disable all

class DailyController < Spree::StoreController
  layout Spree::Config[:layout]
  before_action :admin?
  def send_report
    result = DailyReportMailer.sell_report_email('rodrigo@ktm-shop.cl', Time.zone.today.beginning_of_month.beginning_of_day).deliver
    render text: result
    # redirect_to '/admin'
  end

  def report_yesterday
    result = DailyReportMailer.sell_report_email('rodrigo@ktm-shop.cl', Time.zone.today.prev_day.beginning_of_day).deliver
    render text: result
    # redirect_to '/admin'
  end

  def custom_report
    fechaRequest = Time.zone.parse(params[:fecha]).to_date
    result = DailyReportMailer.sell_report_email('rodrigo@ktm-shop.cl', fechaRequest.beginning_of_day).deliver
    render text: result
    # redirect_to '/admin'
  end

  private

  def admin?
    redirect_to root_path unless spree_user_signed_in? && spree_current_user.admin?
  end
  # rubocop:enable
end
