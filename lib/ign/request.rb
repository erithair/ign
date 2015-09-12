module IGN
  module Request
    class << self
      def get(path, options)
        conn = ::Faraday.new(url: url)
        begin
          response = conn.get(path, options)
          status = response.status
          case status
          when 200
            return response.body
          when 301
            raise IGN::DocMovedError, "status code: #{status}"
          when 404
            raise IGN::NotFoundError, "status code: #{status}"
          else
            raise IGN::UnknownError, "status code: #{status}"
          end
        rescue => error
          raise error
        end
      end

      private

      def url
        "http://#{IGN::CONSTANT::DOMAIN}"
      end
    end
  end
end
