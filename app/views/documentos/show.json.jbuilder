json.partial! "documentos/documento", documento: @documento

json.user do
  json.email  @documento.user.email
end
