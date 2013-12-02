# vendor/assets/javascripts/sleeping_king_studios/backbone/views/base_view.js.coffee

#= require 'sleeping_king_studios/backbone/views'

class SleepingKingStudios.Backbone.Views.BaseView extends Backbone.View
  # Hook for code that must be run when the view is removed. #finalize is
  # automatically called on #remove(), and provides an alternative to
  # overriding #remove, as well as a parallel to the #initialize method.
  finalize: =>
    # Override in sub-classes.

  # Adds a #finalize() call before removing the view from the DOM and removing
  # any bound events.
  remove: =>
    @finalize()

    super()
