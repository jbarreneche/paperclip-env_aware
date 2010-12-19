module Paperclip::EnvAware
  class ConfigReader
    def self.read(name)
      config_file = Rails.root + 'config' + name
      config = if File.readable? config_file
        YAML.load(File.read(config_file)).with_indifferent_access
      else
        Rails.logger.warn "[Paperclip-EnvAware] Missing configuration file #{name}"
        {}
      end
      config[Rails.env] || {}
    end
  end
end