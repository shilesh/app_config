# Create a folder 'app_config' in config
# Create a file 'app_config.yaml' in app_config folder.
# Initialize with entries for test, dev, and prod
# Module name should be dynamic

app_conf_folder = File.join('config', 'app_config')

def return_with_error message
  puts "***************** Error **********************"
  puts message
  puts "**********************************************"
  exit(1)
end

if File.directory? app_conf_folder
  return_with_error('Application already have a config/app_config folder. Still plugin will be installed, make sure values in app_config/*.yml is proper')
else
  Dir.mkdir(app_conf_folder)
  app_config_file = File.join(app_conf_folder, 'app_config.yml')
  return_with_error('Application already have a config/app_config/app_config.yml. Can not install plugin (either rename or remove the file )') if(File.exists? app_config_file)
  app_config_file = File.open(app_config_file, 'w')
  dummy_entries = <<-STR
#***************************************************
# This is an auto generated file by app_config plugin.
#***************************************************
# modify values as needed.
# Once the server is started you can access these values as AppConfig::<key>
# Rename this file and restart the server if you want to invoke values with some other name
# ex: <FileName>::<key>
# Note: If multiple 'yml' files are present here, Only the first one will be considered. 
development:
  title: Dev
test:
  title: Test
production:
  title: Live
STR
    app_config_file << dummy_entries
    puts "******************* config folders created as ****************"
    puts File.expand_path(app_config_file)
    puts "******************* ********************** ****************"
    app_config_file.close
end