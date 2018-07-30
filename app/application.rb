class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      search_item = resp.params["item"]
      if @@items.include?(search_item)
        resp.write "#{search_item.price}"
      else
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end
