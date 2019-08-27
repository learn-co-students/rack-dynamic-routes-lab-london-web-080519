class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      a = @@items.find{|item| item.name == search_term}
      if a
      resp.write a.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
