
json.array! @perfil_eventos do |perfil|
  json.event_id perfil.event_id
  json.event do
    json.title perfil.event.title
    json.start perfil.event.start
    json.lugar perfil.event.lugar
    json.lugar perfil.event.photo

  end
end
