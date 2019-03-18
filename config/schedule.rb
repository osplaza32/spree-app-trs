# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, '/home/deploy/cron_logs/cron_log.log'
#
every :day, at: '7:00 am' do
  runner "DailyReportMailer.sell_report_email('rodrigo.gonzalez@rsl-chile.cl').deliver"
end

every :day, at: '12:01 pm' do
  runner "DailyReportMailer.sell_report_email('rodrigo.gonzalez@rsl-chile.cl').deliver"
end

every :day, at: '5:00 pm' do
  runner "DailyReportMailer.sell_report_email('rodrigo.gonzalez@rsl-chile.cl').deliver"
end
every :day, at: '11:50 pm' do
  if Time.zone.now.to_date == Time.zone.now.end_of_month.to_date
    runner "DailyReportMailer.sell_report_email('rodrigo.gonzalez@rsl-chile.cl').deliver"
  end
end

every 1.day, at: '5:00 am' do
  rake '-s sitemap:refresh'
end

# every 1.minute do
#   runner "DailyReportMailer.sell_report_email('patricio@santiagolab.cl').deliver"
# end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
