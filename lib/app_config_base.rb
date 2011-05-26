#Load app_constants YML file
module AppConfigBase
    
  pattern = File.join('config', 'app_config', '*.yml')
  config_file = Dir.glob(pattern).first
  namespace = File.basename(config_file).split('.').first.classify
  #Dynamic creation of namespace 
  Object.module_eval("module #{namespace}; end")
  klass = namespace.constantize
  
  if File.exists? config_file
    begin
      APP_CONSTANTS = YAML.load_file(config_file) ? YAML.load_file(config_file)[RAILS_ENV] : []  
      APP_CONSTANTS.each do |const|
        klass.const_set(const[0].upcase, const[1])
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

  def klass.method_missing(m, *args, &block)
    "AppConfig:ERROR : Invalid operation: Did you mean <ConfigFileName>::#{m.upcase} ?"  
  end
end