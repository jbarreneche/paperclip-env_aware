module Paperclip
  module EnvAware < Rails::Railties
    initializer 'paperclip-env_aware.extend_paperclip', :after => 'paperclip.insert_into_active_record' do
      # ActiveSupport.on_load :active_record do
      #   Paperclip::Railtie.insert
      # end
    end
  end
end
