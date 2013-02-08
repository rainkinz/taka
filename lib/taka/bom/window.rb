require 'v8'

module Taka
  module BOM

    class Window

      attr_reader :document, :location, :ctx
    
      def initialize(url, content)

        @location = Taka::BOM::Location.new(url)
        # @document = Taka::DOM::HTML(content, :location => @location)
        @document = Taka::DOM::HTML(content, url)
        @document.location = @location
        
        @ctx = V8::Context.new(:with => self)
        
        document.getElementsByTagName('script').each do |script|
          begin
            @ctx.eval(script.textContent)
          rescue V8::JSError => js_e
            puts "JSError: #{js_e.message} evaluating:\n #{script}"
          end
        end
        
      end

      def open(url = nil, name = nil, specs = nil, replace = nil)
        puts "Open called with arguments url: #{url}, name: #{name}, specs: #{specs}, replace: #{replace}"
        Browser.push(url: url, name: name, specs: specs, replace: replace)
      end

      def location=(l)
      end

      def eval(str)
        @ctx.eval(str)
      end
      alias :javascript :eval
      
    
      def alert(message)
        puts "[ALERT] - #{message}"
      end

      def confirm(message)
        puts "[CONFIRM] - #{message}"
      end

      def navigator
        @navigator ||= Navigator.new
      end
      
      def window; self; end
    end
  end
end
