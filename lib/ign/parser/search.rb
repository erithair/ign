module IGN
  module Parser
    module Search
      class << self
        def parse(content)
          doc = ::Nokogiri.HTML(content)
          items = doc.css('#search-list .search-item')

          items.map do |item|
            parse_search_item(item)
          end
        end

        private

        def parse_search_item(item)
          type = item.attribute('data-type').value

          case type
          when 'game'
            parse_game_item(item)
          else
            raise "Unknow search item type: #{type}!"
          end
        end

        def parse_game_item(item)
          game = ::IGN::Parser::Search::Game.new(item)

          ::IGN::Model::Game.new(
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
