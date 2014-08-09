module Crossdomain
  module Config
    def load(opts={})
      options.update opts
    end

    def [](key)
      options[key]
    end

    def options
      @options ||= {
        host: '0.0.0.0', port: '843', xml_path: File.join(Dir.pwd, 'crossdomain.xml')
      }
    end

    def method_missing(meth, *args, &blk)
      options[meth]
    end

    extend self
  end
end
