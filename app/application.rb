class Application
  def call(env)
    resp = Rack::Response.new
    if req.path.match(/items/)
      resp.write "items"
    else 
      resp.status = 404 
    end 
  end       
