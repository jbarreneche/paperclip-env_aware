require 'paperclip'
require 'paperclip-env_aware'
require 'rails'
require 'paperclip/env_aware/active_record/class_methods'

module Paperclip::EnvAware
  class Railtie < ::Rails::Railtie
    config.paperclip_env = ActiveSupport::OrderedOptions.new
    config.paperclip_env.base_dir ||= Rails.root
    initializer 'paperclip-env_aware.extend_paperclip', :after => 'paperclip.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.extend ActiveRecord::ClassMethods
      end
    end
  end
end