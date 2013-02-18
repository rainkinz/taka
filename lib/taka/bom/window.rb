require 'v8'

module Taka
  module BOM

    class Window

      attr_reader :document, :location
    
      # BOM_METHOD
      def open(url = nil, name = nil, specs = nil, replace = nil)
        puts "Open called with arguments url: #{url}, name: #{name}, specs: #{specs}, replace: #{replace}"
        Browser.push(url: url, name: name, specs: specs, replace: replace)
      end
      
      def goto(url, content = nil)
        #(url, content)
        @location = Taka::BOM::Location.new(url)
        # @document = Taka::DOM::HTML(content, :location => @location)
        @document = Taka::DOM::HTML(content, url)
        @document.location = @location

        document.getElementsByTagName('script').each do |script|
          begin
            ctx.eval(script.textContent)
          rescue V8::JSError => js_e
            puts "JSError: #{js_e.message} evaluating:\n #{script}"
          end
        end
        
      end


      def ctx
        @ctx ||= V8::Context.new(:with => self)
      end

      def location=(l)
      end

      def eval(str)
        ctx.eval(str)
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

      def close
        @ctx.dispose() if @ctx
      end
      
    end
  end
end
