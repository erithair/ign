module IGN
  class Error < ::StandardError
  end

  class DocMovedError < Error
  end

  class NotFoundError < Error
  end
end
