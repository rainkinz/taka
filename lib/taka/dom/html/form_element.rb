require 'taka/bom/browser'

module Taka
  module DOM
    module HTML
      module FormElement
        def elements
          xpath('.//select', './/textarea', './/input')
        end

        def length
          elements.length
        end

        def acceptCharset
          self['accept-charset']
        end

        # def method
        #   self['method']
        # end


        def reset
          elements.each do |element|
            next unless element.respond_to?(:defaultValue)
            element['value'] = element.defaultValue
          end
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


        # TODO: Allow user to somehow subscribe to these events. In fact change
        # this to an evented model! 
        def submit

          event = Taka::BOM::Event.new(
            :type => 'submit',
            :target => self
          )
          Taka::BOM::Events.dispatch_event(event)
                    
          # Ideally we'd do something like this which would bubble the event 
          # up until it's captured by an element with a listener for the event
          # dispatch_event({ :method => self['method'], :action => self['action'], :params => form_params })
          
          # Does nothing for now
          # refer to https://github.com/cowboyd/therubyracer/wiki/Accessing-Ruby-Objects-From-JavaScript
          proc do 
            # puts "Submit pressed: #{self['method']}: #{self['action']} #{form_params}"
            # TODO: Replace with Events
            Taka::BOM::Browser.push({ :method => self['method'], :action => self['action'], :params => form_params })
          end
        end

        
        def form_params
          # Hash[form_fields.map {|k,n| [k, n.value] }]
          vals = form_fields.map do |field_name, field|
            # puts "Getting value of #{field_name}"
            [field_name, field.value]
          end
          Hash[vals]
        end

        # TODO: Do I want to keep this? Purely for ruby side calls
        # into this object
        def method_missing(meth, *args, &block)
          puts "METHOD MISSING CALLED"
          if a = self[meth.to_s]
            a
          else
            super 
          end
        end
              
        def [](name)
#          puts "calling self[#{name}]"
          if child = child_by_name(name)
            child
          else
            super
          end
        end

        def child_by_name(name)
          form_fields[name]
          # if self.children
          #   h = self.children.inject({}) {|h,v| h[v['name']] = v; h }
          #   h[name.to_s]
          # else
          #   nil
          # end
        end

        # TODO: REALLY NEED TO TEST THIS
        def form_fields

          # TODO: Add others as needed
          inputs = {}
          self.xpath(".//input").each do |input|
            if form_field?(input.type)
              if input.type == 'radio'
                inputs[input['name']] ||= Taka::BOM::Radios.new
                inputs[input['name']].add(input)
              else
                inputs[input['name']] = input
              end
            else
              # puts "#{input.name}: #{input.type} is not a form field. Ignoring"
            end
          end
          selects = self.xpath(".//select").inject({}) {|h,v| h[v['name']] = v; h }

          inputs.merge(selects)
        end

        def form_field?(type)
          ['hidden', 'input', 'radio', 'select', 'text', 'textarea'].include?(type.downcase)
        end
        
        # # def [](name)
        # #   puts "Calling form []"
        # #     send(:method_missing, name, nil)
        # # end

      
      end
    end
  end
end
