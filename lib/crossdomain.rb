require 'bundler/setup'
require "crossdomain/version"
require 'active_support/core_ext/string'
require 'nokogiri'
require 'net/http'

module Crossdomain
end


module Crossdomain

  def self.logger
    Crossdomain::Logging.logger
  end

  def self.logger=(log)
    Crossdomain::Logging.logger = log
  end

end


File.tap do |f|
  Dir[f.expand_path(f.join(f.dirname(__FILE__), 'crossdomain', '*.rb'))].each do |file|
    Crossdomain.autoload File.basename(file, '.rb').camelize, file
  end
end
