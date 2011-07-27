# Include hook code here
if File.directory?(File.join('config', 'app_config'))
  require 'lib/app_config_base.rb'
else
  puts "***************** Error **********************"
  puts " 'config/app_config' is not present : "
  puts "**********************************************"
  `mkdir config/app_config`
end  