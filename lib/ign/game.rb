module IGN
  module Game
    class << self
      def search(name, options = {})
        options = Hash(
          'q' => name,
          'type' => 'object',
          'objectType' => 'game',
          'filter' => 'game',
          'page' => 0, # 0, 1, 2, ...
          'count' => 10
        )
        response = ::IGN::Search.new('/search', options).response
        parse response
      end

      private

      def parse(content)
        # TODO parse html
        ::IGN::Parser::Search.parse(content)
      end
    end
  end
end
