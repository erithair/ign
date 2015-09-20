module IGN
  module Parser
    module Search
      class << self
        def parse(content)
          items = get_search_results(content)

          items.map do |item|
            parse_search_result(item)
          end
        end

        private

        def get_search_results(content)
          doc = ::Nokogiri.HTML(content)
          doc.css('#search-list .search-item')
        end

        def parse_search_result(item)
          type = item.attribute('data-type').value

          case type
          when 'game'
            game = parse_game_item(item)
            generate_game_resource(game)
          else
            raise "Unknow search item type: #{type}!"
          end
        end

        def parse_game_item(item)
          ::IGN::Parser::Search::Game.new(item)
        end

        def generate_game_resource(game)
          ::IGN::Resource::Game.new(
            name: game.name,
            id: game.id,
            handle: game.handle,
            thumb: game.thumb,
            rating: game.rating,
            publisher: game.publisher,
            platforms: game.platforms,
            release_date: game.release_date,
            description: game.description
          )
        end
      end
    end
  end
end
