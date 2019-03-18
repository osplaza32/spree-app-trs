# Mailer de los reportes de ventas
# rubocop:disable all
class DailyReportMailer < ActionMailer::Base
  def sell_report_email(mail, start_date = Time.zone.today.beginning_of_month.beginning_of_day)
    @orders = Spree::Order.complete.all.where(completed_at: [start_date..Time.zone.today.end_of_month.end_of_day])
    @variant = Spree::Variant.all
    hora_reporte = Time.zone.now.strftime('%d-%m-%Y %H:%M')
    temp_file = Tempfile.new('new_file.csv')
    # Headers
    temp_file.write ('Fecha,Hora,Número de compra,SKU Productos,Total de productos,Costos de envío,Nombre Destinatario,Dirección de despacho,Comuna,Teléfono,E-Mail,RUT,Instrucciones de envio')
    temp_file.write ("\n")
    # Genera lineas por cada orden
    @orders.each do |order|
      temp_file.write order.updated_at.strftime('%d-%m-%Y')
      temp_file.write(',')
      temp_file.write order.updated_at.strftime('%H:%M')
      temp_file.write(',')
      temp_file.write order.number
      temp_file.write(',')
      order.line_items.each do |item|
        variant = @variant.find_by(id: item.variant_id)
        temp_file.write(variant ? variant.sku : '')
        temp_file.write(' ')
        temp_file.write(' [')
        temp_file.write(item.quantity)
        temp_file.write('] ')
      end
      temp_file.write(',')
      temp_file.write(order.item_total)
      temp_file.write(',')
      temp_file.write(order.shipment_total)
      temp_file.write(',')
      temp_file.write(order.ship_address.firstname + ' ' + order.ship_address.lastname)
      temp_file.write(',')
      temp_file.write((order.ship_address.address1 + ' ' +
      order.ship_address.address2.to_s).gsub(',', ' '))
      temp_file.write(',')
      temp_file.write(order.ship_address.city)
      temp_file.write(',')
      temp_file.write(order.ship_address.phone)
      temp_file.write(',')
      temp_file.write(order.email)
      temp_file.write(',')
      temp_file.write(order.ship_address.rut)
      temp_file.write(',')
      temp_file.write(order.special_instructions)
      temp_file.write("\n")
    end
    temp_file.rewind
    temp_file.close

    attachments['reporte-ventas ' + hora_reporte + '.csv'] = File.read(temp_file.path)
    mail(to: mail,
         subject: 'Reporte de Ventas KTM-Shop ' + hora_reporte,
         bcc: 'webmaster@santiagolab.cl')
    temp_file.unlink
  end

  # rubocop:enable

end
