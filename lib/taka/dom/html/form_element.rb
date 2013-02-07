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

        def submit
          # Does nothing for now
          # refer to https://github.com/cowboyd/therubyracer/wiki/Accessing-Ruby-Objects-From-JavaScript
          proc do 
            #puts "Submit pressed: #{self['method']}: #{self['action']} "
            puts "Submit pressed"
          end
        end

        def form_params
        end

        # TODO: Do I want to keep this? Purely for ruby side calls
        # into this object
        def method_missing(meth, *args, &block)
          puts "METHOD MISSING CALLED"
          if a = self[meth]
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
#            puts "No child named #{name} found calling super"
            super
          end
        end

        def child_by_name(name)
          if self.children
            h = self.children.inject({}) {|h,v| h[v['name']] = v; h }
            h[name.to_s]
          else
            nil
          end
        end
        
        # # def [](name)
        # #   puts "Calling form []"
        # #     send(:method_missing, name, nil)
        # # end

      
      end
    end
  end
end
