# Uninstall hook code here
p __FILE__ 
`rm -rf conf/app_config`
puts " 'conf/app_config/*' removed"

`rm -rf vendor/plugins/app_config`
puts " 'vendor/plugins/app_config/*' removed"