require 'uri'

module Taka
  
  module BOM
    
    class Location
  
      def initialize(uri)
        if uri.is_a?(String)
          @uri = URI.parse(uri)
        elsif uri.is_a?(URI)
          @uri = uri
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
