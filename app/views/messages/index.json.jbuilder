json.array! @messages.each do |message|
  json.name     message.user.name
  json.created_at     message.created_at
  json.body     message.body
  json.image    message.image
  json.id       message.id
end
