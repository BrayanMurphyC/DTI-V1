json.extract! registro_evento, :id, :certificado, :asistencia, :event_id, :subscriber_id, :created_at, :updated_at
json.url registro_evento_url(registro_evento, format: :json)