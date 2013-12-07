module JSONRespond
  def json(code = 200, object = nil)
    content_type  :json
    body          Oj.dump object
    status        code
  end
end