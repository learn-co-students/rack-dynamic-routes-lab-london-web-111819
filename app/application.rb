class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      Item.new("Figs",3.42)
      Item.new("Pears",0.99)
   
      if req.path=="/items/"
        item_name = req.path.split("/items/").last
        resp.write item_name
        
        # if Item.find_by(name:item_name)
        #     resp.write Item.find_by(name:item_name).price
        # else
        #     resp.write "Item not found"
        #     resp.status = 400
        # end
 
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end