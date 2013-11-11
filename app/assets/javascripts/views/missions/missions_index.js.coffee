class MissionControl.Views.MissionsIndex extends Backbone.View
  tagName: 'section'
  id:      'missions'

  render: () =>
    # Render the table.
    @$el.html JST['missions/index']()

    # Render the table rows.
    table = this.$('table tbody')
    for mission in @collection.models
      missionView = new MissionControl.Views.Mission({ model: mission })
      table.append(missionView.render().el)

    this