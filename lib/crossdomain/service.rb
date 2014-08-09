require 'socket'

module Crossdomain
  module Service
    def start

      # Validates XML against Adobe's schema
      xml = Crossdomain::XML.validate!(Crossdomain::Config[:xml_path])

      unless xml
        Crossdomain.logger.error "Missing or malformed xml at #{Crossdomain::Config[:xml_path]}"
        return
      end

      if Crossdomain::Config[:port].to_i < 1000 and Process.uid != 0
        Crossdomain.logger.error "You need to be root to bind to port #{Crossdomain::Config[:port]}"
        return
      end

      Crossdomain.logger.info "Binding to #{Crossdomain::Config[:host]}:#{Crossdomain::Config[:port]}"
      @server = TCPServer.new Crossdomain::Config[:host], Crossdomain::Config[:port]

      # Drop privileges
      Crossdomain.logger.info "Dropping privileges to nobody"
      uid = Etc.getpwnam("nobody").uid
      Process::Sys.setuid(uid)

      begin

        loop do
          Thread.start(@server.accept) do |client|
            client.puts xml
            client.close
          end
        end

      rescue Interrupt
        #@server.stop
        Crossdomain.logger.info "Shutting down..."
      end
    end

    def check_permissions
    end

    def stop
      @server.stop
    end

    extend self
  end
end
