module IGN
  module Resource
    class Game < Base
      attr_accessor :name, :handle, :id, :rating, :release_date,
                    :thumb, :description, :publisher, :platforms
    end
  end
end
