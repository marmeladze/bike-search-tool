json.extract! product, :id, :name, :manufacturer_url, :features, :created_at, :updated_at
json.url product_url(product, format: :json)
