# Include hook code here
if File.directory? (File.join('config', 'app_config')
  require 'app_config_base'
else
  puts "***************** Error **********************"
  puts " 'config/app_config' is not present : "
  puts "**********************************************"
  `mkdir config/app_config`
end  