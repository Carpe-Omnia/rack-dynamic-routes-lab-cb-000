class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if Item.find_by_name(item_name) != nil
        resp.write "#{Item.find_by_name(item_name).price}"
      else
        resp.status = 400
        resp.write "We don't have that item"
      end
    else
      resp.status = 404
    end
    resp.finish
  end

end
