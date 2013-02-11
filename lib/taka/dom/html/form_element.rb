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

        # def submit
        #   # Does nothing for now
        #   # refer to https://github.com/cowboyd/therubyracer/wiki/Accessing-Ruby-Objects-From-JavaScript
        #   proc do 
        #     puts "Submit pressed: #{self['method']}: #{self['action']} #{form_params}"
        #     #{ :method => self['method'], :aciton => self['action'], :params => form_fields }
        #   end
        # end

        # TODO: Allow user to somehow subscribe to these events. In fact change
        # this to an evented model! 
        def submit
          # Does nothing for now
          # refer to https://github.com/cowboyd/therubyracer/wiki/Accessing-Ruby-Objects-From-JavaScript
          proc do 
            # puts "Submit pressed: #{self['method']}: #{self['action']} #{form_params}"
            Taka::BOM::Browser.push({ :method => self['method'], :action => self['action'], :params => form_params })
          end
        end

        
        def form_params
          Hash[form_fields.map {|k,n| [k, n.value] }]
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
          inputs = self.xpath(".//input").inject({}) {|h,v| h[v['name']] = v; h }
          selects = self.xpath(".//select").inject({}) {|h,v| h[v['name']] = v; h }

          inputs.merge(selects)
          
#           if self.children
#             # h = self.children.inject({}) {|h,v| h[v['name']] = v if form_field?(v['type']); h } 
#             h = self.xpath(".//input").inject({}) {|h,v| h[v['name']] = v if form_field?(v['type']); h }
# #            binding.pry
#           else
#             {} 
#           end
        end

        def form_field?(type)
          ['hidden', 'input', 'textarea','select'].include?(type)
        end
        
        # # def [](name)
        # #   puts "Calling form []"
        # #     send(:method_missing, name, nil)
        # # end

      
      end
    end
  end
end
