module Paperclip::EnvAware
  module ActiveRecord
    module ClassMethods
      def has_attached_file(*args)
        opts = ConfigReader.read('paperclip_env.yml').reverse_merge(args.extract_options!)
        args.push(opts.symbolize_keys)
        puts args.inspect
        super(*args)
      end
    end
  end
end