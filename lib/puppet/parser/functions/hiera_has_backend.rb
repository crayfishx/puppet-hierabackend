module Puppet::Parser::Functions
  newfunction(:hiera_has_backend, :type => :rvalue) do |*args|

    require 'yaml'
    search_backend = args[0].to_s

    configfile = File.join(File.dirname(Puppet.settings[:config]), "hiera.yaml")
    raise(Puppet::ParseError, "Hiera config file #{configfile} not readable") unless File.exists?(configfile)

    config = YAML.load_file(configfile)
    backends = config[:backends]
    backends.include? search_backend
  end
end
