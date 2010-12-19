require 'spec_helper'

module Paperclip::EnvAware
  describe "Env aware hooks" do
    let(:active_record_meta_class) { class << ::ActiveRecord::Base; self; end }
    it 'hooks under PaperClip::ClassMethods' do
      paperclip_index = active_record_meta_class.ancestors.index(Paperclip::ClassMethods)
      env_aware_index = active_record_meta_class.ancestors.index(Paperclip::EnvAware::ActiveRecord::ClassMethods)
      env_aware_index.should < paperclip_index
    end
    context "Overriding has_attached_file" do
      class Super
        def initialize(parent_object)
          @parent_object = parent_object
        end
        def method_missing(method, *args, &block)
          @parent_object.send method, *args, &block
        end
      end
      before do
        @super = double('Stormable')

        @object= Super.new(@super)
        @object.extend Paperclip::EnvAware::ActiveRecord::ClassMethods
      end
      it 'overrides has_attached_file' do
        @object.should respond_to(:has_attached_file)
      end
      it 'calls super' do
        ConfigReader.stub(:read) { {:updated_opts => true} }
        @super.should_receive(:has_attached_file).with(:photo, :updated_opts => true)
        @object.has_attached_file :photo
      end
    end
  end
end