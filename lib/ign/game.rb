module IGN
  module Game
    class << self
      def search(name, options = {})
        search_options = construct_search_options(name, options)
        response = get_search_response(search_options)
        parse response
      end

      private

      def get_search_response(options)
        ::IGN::Search.new('/search', options).response
      end

      def construct_search_options(name, options)
        default_search_options.merge!(options).merge!(q: name)
      end

      def default_search_options
        HashWithIndifferentAccess.new(
          'type' => 'object',
          'objectType' => 'game',
          'filter' => 'game',
          'page' => 0, # 0, 1, 2, ...
          'count' => 10
        )
      end

      def parse(content)
        ::IGN::Parser::Search.parse(content)
      end
    end
  end
end
