module Paperclip::EnvAware
  module ActiveRecord
    module ClassMethods
      def has_attached_file(*args)
        opts = ConfigReader.read('paperclip_env.yml').merge(args.extract_options!)
        args.push(opts.symbolize_keys)
        super(*args)
      end
    end
  end
end