require 'spec_helper'

module Paperclip::EnvAware
  describe ConfigReader do
    it 'reads from Rails.root/config/:name' do
      File.should_receive(:read).with(Rails.root + 'config' + 'paperclip_env.yml') { "---\n\tdevelopment: 3" }
      ConfigReader.read('paperclip_env.yml')
    end
    it 'parses config file with YAML' do
      File.stub(:read).with(Rails.root + 'config' + 'paperclip_env.yml') { "---" }
      YAML.should_receive(:load).with('---') { {:ble => :bla} }
      ConfigReader.read('paperclip_env.yml')
    end
    it 'returns parsed from de Rails.env' do
      File.stub(:read).with(Rails.root + 'config' + 'paperclip_env.yml') { "---" }
      YAML.stub(:load).with('---') { {:development => {:ble => :bla} } }
      ConfigReader.read('paperclip_env.yml').should == {"ble" => :bla}
    end
    it 'doesnt break when missing config environment' do
      File.stub(:read).with(Rails.root + 'config' + 'paperclip_env.yml') { "---" }
      YAML.stub(:load).with('---') { {:test => {:ble => :bla} } }
      ConfigReader.read('paperclip_env.yml').should == {}
    end
    it 'logs when file doesn\'t exist' do
      Rails.logger.should_receive(:warn).with(/Missing configuration file unexisting_file\.yml/)
      ConfigReader.read('unexisting_file.yml').should == {}
    end
  end
end