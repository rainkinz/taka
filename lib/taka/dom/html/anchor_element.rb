module Taka
  module DOM
    module HTML
      module AnchorElement
        def name
          self['name']
        end

        def tabIndex
          (self['tabindex'] || 0).to_i
        end

        def type
          self['type']
        end

        # BOM
        def click
          event = Taka::BOM::Event.new(
            :type => 'click',
            :target => self
          )
          Taka::BOM::Events.dispatch_event(event)         
        end
        
        def blur
          # does nothing....
        end

        def focus
          # also does nothing
        end


        def event_handlers
          @event_handlers ||= {}
        end

        def event_handler_for(event_name)
          event_handlers[event_name] || []
        end
        
        def addEventListener(event_name, handler, capture = false)
          event_handlers[event_name] ||= [] # todo check event names
          event_handlers[event_name] << handler
        end

        
      end
    end
  end
end
