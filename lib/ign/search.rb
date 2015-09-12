module IGN
  class Search
    attr_reader :response

    def initialize(path, options)
      @response = IGN::Request.get(path, options)
    end
  end
end
