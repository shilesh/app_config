#Load app_constants YML file
module AppConfig
  config_file = File.join(RAILS_ROOT, "/config/app_config.yml")
  if File.exists? config_file
    begin
      APP_CONSTANTS = YAML.load_file(config_file) ? YAML.load_file(config_file)[RAILS_ENV] : []  
      APP_CONSTANTS.each do |const|
        AppConfig.const_set(const[0].upcase, const[1])
      end
    rescue Exception => e
      puts "********** AppConfig : ERROR ****************"
      puts "** Error reading #{config_file}"
      puts "** #{e.message}"
      puts "*********************************************"
    end  
  else
     puts "************************** AppConfig : WARNING *****************************"
     puts "** Can not load values from config file "
     puts "** #{config_file} is missing "
     puts "****************************************************************************"
  end

 def self.method_missing(m, *args, &block)
    puts "********** AppConfig : ERROR ****************"
	  puts "Invalid operation: Did you mean AppConfig::#{m} ?"
    puts "*********************************************"
 end
end
