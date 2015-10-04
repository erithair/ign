module IGN
  module Resource
    class Game < Base
      has_attribute :name, :handle, :id, :rating, :release_date,
                    :thumb, :description, :publisher, :platforms
    end
  end
end
