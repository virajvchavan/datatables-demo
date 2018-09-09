json.extract! order, :id, :dish_name, :quantity, :price, :location, :order_time, :created_at, :updated_at
json.url order_url(order, format: :json)
