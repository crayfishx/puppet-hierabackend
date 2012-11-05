module Puppet::Parser::Functions

  newfunction(:hiera_backend, :type => :rvalue) do |*args|

    require 'yaml'
    require 'hiera'
    require 'hiera/scope'

    if args[0].is_a?(Array)
      args = args[0]
    end

    backend = args[0]
    key = args[1]
    default = args[2]
    override = args[3]


    configfile = File.join(File.dirname(Puppet.settings[:config]), "hiera.yaml")
    raise(Puppet::ParseError, "Hiera config file #{configfile} not readable") unless File.exists?(configfile)

    config = YAML.load_file(configfile)
    backends = config[:backends]
    raise(Puppet::ParseError, "Hiera backend #{backend} not configured") unless backends.include? backend

    config[:backends] = [ backend ]

    hiera = Hiera.new(:config => config)

    if self.respond_to?("[]")
      hiera_scope = self
    else
      hiera_scope = Hiera::Scope.new(self)
    end

    answer = hiera.lookup(key, default, hiera_scope, override, :priority)
    raise(Puppet::ParseError, "Could not find data item #{key} in any Hiera data file and no default supplied") if answer.nil?
    return answer
   end
end



