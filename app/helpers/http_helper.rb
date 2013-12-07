module HttpHelper
  OK = 200
  NOT_FOUND = 404

  def not_found
    halt(NOT_FOUND)
  end
end