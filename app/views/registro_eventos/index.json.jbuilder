
json.array! @registro_eventos do |registro_evento|
  json.subscriber_id registro_evento.subscriber_id
  json.subscriber do
    json.profile registro_evento.subscriber.profile
    json.nombres registro_evento.subscriber.nombres
    json.email registro_evento.subscriber.email
  end
end
