module Taka

  module BOM

    class Browser
      
      def self.push(op)
        ops << op
      end

      def self.ops
        @ops ||= []
      end

      # TODO: This will change
      def open(url, content = nil)
        window = Window.new
        window.goto(url, content)
        window
      end
      
    end
  
  end
  
end
