module Taka

  module BOM

    class Browser
      
      def self.push(op)
        ops << op
      end

      def self.ops
        @ops ||= []
      end
      
    end
  
  end
  
end
