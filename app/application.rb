class Application
  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.start_with?("/items/")
      q = req.path.split("/items/")[1]
      item = Item.find_by_name(q)
      if item
        res.write "#{item.price}"
      else
        res.write "Item not found"
        res.status = 400
      end
    else
      res.write "Route not found"
      res.status = 404
    end
    res.finish
  end
end