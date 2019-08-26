class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split('/').last
            if self.find_item_by_name(item_name) #item exists
                # binding.pry
                resp.write "#{self.find_item_by_name(item_name).price}"
            else #item doesn't exist
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        
        resp.finish
    end

    def find_item_by_name(item_name)
        @@items.find{|item|item.name == item_name}
    end
end

# class Application

#     @@items = []
#     def call(env)
#       resp = Rack::Response.new
#       req = Rack::Request.new(env)
  
#       if req.path.match(/items/)
#         item_name = req.path.split("/items/").last
#         if item =@@items.find{|i| i.name == item_name}
#           resp.write item.price
#         else 
#           resp.status = 400
#           resp.write "Item not found"
#         end
#       else
#         resp.status=404
#         resp.write "Route not found"
#       end
#       resp.finish
#     end
  
#   end