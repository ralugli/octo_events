# frozen_string_literal: true

json.events @events do |event|
  json.id event.id
  json.action event.action
  json.created_at I18n.l(event.created_at)
end
