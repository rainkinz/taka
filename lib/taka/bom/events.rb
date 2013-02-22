module Taka
  module BOM

    class Event
      attr_reader :type, :target
      
      def initialize(attrs = {})
        @type = attrs[:type] # String, the name of the event, e.g. 'submit', 'click'
        @target = attrs[:target] # the object that caused the event
      end
      
    end

    class Events
      
      def self.dispatch_event(event)
        puts "dispatching event #{event.type}"
        target = event.target || raise("No target defined for event")
        event_name = event.type 
        
        handled = false
        target.event_handler_for(event_name).each do |handler|
          puts "Calling handler #{handler}"
          handler.call(event)
          handled = true
        end
        
        if !handled
          if target.is_a?(Taka::DOM::HTML::AnchorElement)
          
            if target['href'] =~ /^javascript/
              # puts "Invoking #{target['href']}"
              target.document.window.javascript(target['href'])
            end
          end

        end
        
      end
      
    end
    
  end
end
