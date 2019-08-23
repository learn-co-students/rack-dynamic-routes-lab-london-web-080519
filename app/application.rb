class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            #whole path and items to it 
            item_name = req.path.split("/items/").last 
            #what's after items - it will pick it - isolate the part of the URL
            item = @@items.find{|fruit| fruit.name == item_name} 
            if @@items.include?(item) == false
                resp.write "Item not found"
                resp.status = 400
            else 
                resp.write "#{item.price}" 
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
end