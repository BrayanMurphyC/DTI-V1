json.partial! "events/event", event: @event

json.user do
  json.email @event.user.emails
end

json.array! @evento_ponentes do |evento_ponente|
  json.ponente do
    json.nombres evento_ponente.ponente.nombres
    json.profile evento_ponente.ponente.profile
    json.tema evento_ponente.tema
  end
end
