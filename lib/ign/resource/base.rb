module IGN
  module Resource
    class Base
      def initialize(info = {})
        info.each do |attr, value|
          setter = "#{attr}="
          send(setter, value) if respond_to? setter
        end
      end
    end
  end
end
