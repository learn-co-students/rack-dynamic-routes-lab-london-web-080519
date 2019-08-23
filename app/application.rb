class Application

    @@items = [Item.new("Banana", 9)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match("/items/")
            # resp.write "You requested an item"
            item_name = req.path.split("/items/").last
            item = @@items.find{|item| item.name == item_name}
            if item
                resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end

end