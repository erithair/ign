module IGN
  module Resource
    class Base
      class << self
        attr_reader :attributes

        def has_attribute(*attrs)
          @attributes = [*attrs]
          attr_reader(*attrs)
        end
      end

      def initialize(info = {})
        info.slice(*attributes).each do |attr, value|
          instance_variable_set "@#{attr}", value
        end
      end

      def attributes
        self.class.attributes
      end
    end
  end
end
