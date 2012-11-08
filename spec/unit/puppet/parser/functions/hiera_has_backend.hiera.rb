require 'puppet'
require 'yaml'

RSpec.configure { |config| config.mock_with :mocha }

describe Puppet::Parser::Functions.function(:has_hiera_backend) do
  let :scope do
   Puppet::Parser::Scope.new
  end

  let (:configfile) { File.join(File.dirname(Puppet.settings[:config]), "hiera.yaml") }
  let (:hiera_config) { { :backends => ['yaml','json','gpg'] } }

  it "should return false for backend foo" do
    File.expects(:exists?).with(configfile).returns(true)
    YAML.expects(:load_file).with(configfile).returns(hiera_config)
    scope.function_hiera_has_backend(['foo']).should == false
  end

  it "should return true for backend yaml" do
    File.expects(:exists?).with(configfile).returns(true)
    YAML.expects(:load_file).with(configfile).returns(hiera_config)
    scope.function_hiera_has_backend(['yaml']).should == true
  end
end
