require 'uri'

module Taka
  
  module BOM
    
    class Location
  
      def initialize(uri)
        if uri.is_a?(String)
          @uri = URI.parse(uri)
        elsif uri.is_a?(URI)
          @uri = uri
        else
          raise ArgumentError, "uri: #{uri} must be a URI or a String not #{uri.class}"
        end
      end

      def protocol
        @uri.scheme
      end

      def to_s
        @uri.to_s
      end
        
    end
  end
  
end
