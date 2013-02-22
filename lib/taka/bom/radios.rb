module Taka
  module BOM
    class Radios

      def initialize
        @radios = []
        @value = nil
      end

      def add(input)
        @radios << input
      end

      def value
        @radios.each do |r|
          if r['checked']
            return r.value
          end
        end
      end

    end
  end
end
