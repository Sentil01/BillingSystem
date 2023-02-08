json.extract! product, :id, :price, :tax, :quantity, :shop_id, :created_at, :updated_at
json.url product_url(product, format: :json)
