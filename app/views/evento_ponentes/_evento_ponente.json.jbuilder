json.extract! evento_ponente, :id, :tema, :rate, :ponente_id, :event_id, :created_at, :updated_at
json.url evento_ponente_url(evento_ponente, format: :json)