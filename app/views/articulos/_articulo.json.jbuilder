json.extract! articulo, :id, :title, :body, :tags, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)