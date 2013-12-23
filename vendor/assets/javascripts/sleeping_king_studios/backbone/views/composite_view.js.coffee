# vendor/assets/javascripts/sleeping_king_studios/backbone/views/composite_view.js.coffee

#= require 'sleeping_king_studios/backbone/views/base_view'

class SleepingKingStudios.Backbone.Views.CompositeView extends SleepingKingStudios.Backbone.Views.BaseView
  initialize: (options) =>
    super options

    @_parent   = null
    @_children = []

  # The current parent view.
  parent: => @_parent

  # The current child views.
  children: => @_children

  addChild: (child, options) =>
    # TODO: Ensure child is duck-type compatible with CompositeView.

    if child.parent()?
      # Views are not currently reusable, so throw an error if attempting to
      # move a View from one parent to another.
      throw new Error 'child View already has a parent'

    child._parent = this

    @_children.push child

    $parentElement = @_$defaultContainer()
    $parentElement.append(child.el)

  hasChild: (child) =>
    -1 < _.indexOf @_children, child

  removeChild: (child, options) =>
    # Ensure child is child of this instance.
    unless @hasChild(child)
      throw new Error 'object is not a child of this View'

    child._parent = null
    @_children = _.without @_children, child
    child.$el.remove()

  # The element that children will be added to by default. Unless otherwise
  # specified, defaults to the root element.
  _$defaultContainer: => @$el
