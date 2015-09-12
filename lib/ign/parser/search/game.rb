module IGN
  module Parser
    module Search
      class Game
        def initialize(doc)
          @doc = doc
        end

        def name
          @name ||= raw_title.text.strip
        end

        def id
          @id ||= url.split('-')[-1]
        end

        def handle
          @handle ||= url.scan(/http:\/\/#{IGN::CONSTANT::DOMAIN}\/games\/(.+)\/.*/)[0].try(:first)
        end

        def thumb
          @thumb ||= raw_thumb.try(:attribute, 'src').try(:value)
        end

        def rating
          @rating ||= raw_review_score.try(:text).try(:strip).try(:to_f)
        end

        def publisher
          @publisher ||= raw_subtiles[0].text.strip
        end

        def platforms
          @platforms ||= raw_subtiles[1..-1].map do |plt|
            plt.text.strip
          end
        end

        def release_date
          @release_date ||= raw_description.css('.publish-date').text.strip
        end

        def description
          @description ||= raw_description_without_publish_date.text.strip[2..-1]
        end

        private

        def doc
          @doc
        end

        def url
          @url ||=
            raw_title.attribute('href').value
        end

        def raw_title
          @raw_title ||=
            doc.css('.search-item-title a')[0]
        end

        def raw_thumb
          @raw_thumb ||=
            doc.css('.search-item-media img')[0]
        end

        def raw_review_score
          @raw_review_score ||=
            doc.css('.search-item-media .review-score')[0]
        end

        def raw_subtiles
          @raw_subtiles ||=
            doc.css('.search-item-sub-title a')
        end

        def raw_description
          @raw_description ||=
            doc.css('.search-item-description')[0]
        end

        def raw_description_without_publish_date
          @raw_description_without_publish_date ||=
            begin
              raw_desc = raw_description.dup
              raw_desc.css('.publish-date').remove
              raw_desc
            end
        end
      end
    end
  end
end
