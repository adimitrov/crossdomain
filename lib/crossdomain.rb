require 'bundler/setup'
require "crossdomain/version"
require 'nokogiri'
require 'net/http'



module Crossdomain
end

require 'crossdomain/config'
require 'crossdomain/logging'
require 'crossdomain/service'
require 'crossdomain/XML'


module Crossdomain

  def self.logger
    Crossdomain::Logging.logger
  end

  def self.logger=(log)
    Crossdomain::Logging.logger = log
  end

end
