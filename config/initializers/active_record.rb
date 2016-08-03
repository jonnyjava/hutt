require 'erb'
env_file = 'config/local_env.yml'
YAML.load(File.open(env_file)).each do |key, value|
  ENV[key.to_s] = value
end if File.exist?(env_file)

db = YAML.load(ERB.new(File.read('./config/database.yml')).result)[Napa.env]

ActiveRecord::Base.establish_connection(db)
ActiveRecord::Base.logger = Napa::Logger.logger if Napa.env.development?
ActiveRecord::Base.include_root_in_json = false
