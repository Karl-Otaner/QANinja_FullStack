require "report_builder"
require "date"
# Toda vez que executar um cenario
# Start o cenario
Before do
  driver.start_driver
  driver.manage.timeouts.implicit_wait = 15

  device_type = "android"
  @screen = DroidScreens.new if device_type.eql?("android")
  @screen = IOSScreens.new if device_type.eql?("ios")
end

Before ("@login") do
  @user = { email: "carlos@silva.io", pass: "pass123" }
  @screen.home.go_account
  @screen.login.with(@user[:email], @user[:pass])
end
Before("@clean_cart") do
  @user = { email: "carlos@silva.io", pass: "pass123" }
  PixelApi.new.remove_my_cart(@user[:email])
end
After do |scenario| # interpolação - tira um screenshot no final de cada cenario
  screenshot = driver.screenshot_as(:base64)
  embed(screenshot, "image/png", "Screenshot")
  # Fecha o cenario
  driver.quit_driver
end

at_exit do
  @infos = {

    "device" => "Android",
    "environment" => "Dev",
    "Data do Teste" => Time.now.to_s,
  }

  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report"
    config.report_types = [:html]
    config.report_title = "Pixel Mobile"
    config.additional_info = @infos
    config.color = "indigo"
  end
  ReportBuilder.build_report
end
