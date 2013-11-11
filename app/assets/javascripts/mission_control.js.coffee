window.MissionControl =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: () ->
    console.log 'Hello from Backbone!'
    Backbone.history.start()
