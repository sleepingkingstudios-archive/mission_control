class MissionControl.Routers.Missions extends Backbone.Router
  initialize: (options) =>
    @missions = new MissionControl.Collections.Missions(options.missions)

  routes:
    '' : 'index'

  index: () =>
    view = new MissionControl.Views.MissionsIndex(collection: @missions)
    $('#page-contents').append(view.render().$el)
