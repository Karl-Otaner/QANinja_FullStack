require "appium_lib"
require "appium_console"
require "pry"
require "report_builder"
# Configuração do Appium para carregar o arquivo de capability através do caps/appium.txt
caps = Appium.load_appium_txt file: File.expand_path("caps/appium.txt", __dir__), verbose: true
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
