require 'pry'

class Application

    @@items = [Item.new('item1', 10), Item.new('item2', 20)]


    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)

            item_name = req.path.split("/items/").last
            if @@items.find { |item| item.name == item_name }
                item = @@items.find { |item| item.name == item_name }
               resp.write item.price
            elsif @@items.find { |item| item.name == item_name } == nil
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