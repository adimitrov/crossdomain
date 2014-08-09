require 'nokogiri'
require 'open-uri'

module Crossdomain
  module XML
    CROSSDOMAIN_SCHEMA_FILE = '/Users/alex/Sites/Social/crossdomain/vendor/PolicyFile.xsd'
    def validate!(xml_path)

      xml = File.read(xml_path)
      doc = Nokogiri::XML(xml)
      return false if doc.errors.size > 0

      xsd = Nokogiri::XML::Schema(File.read(CROSSDOMAIN_SCHEMA_FILE))


      xsd.validate(doc).each do |error|
        Crossdomain.logger.warning error.message
      end

      xml
    end
    extend self
  end
end
