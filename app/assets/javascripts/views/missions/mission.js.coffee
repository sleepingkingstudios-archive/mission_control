class MissionControl.Views.Mission extends Backbone.View
  tagName: 'tr'

  render: () =>
    @$el.html JST['missions/mission']( mission: @model )
    this
