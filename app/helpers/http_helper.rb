module HttpHelper
  OK = 200
  NOT_FOUND = 404
  NO_CONTENT = 204

  def not_found
    halt(NOT_FOUND)
  end

  def no_content
    halt(NO_CONTENT)
  end
end