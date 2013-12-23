# spec/javascripts/sleeping_king_studios/backbone/views/composite_view_spec.js.coffee

#= require_tree '../../utils'
#= require 'sleeping_king_studios/backbone/views/composite_view'

describe 'SleepingKingStudios.Backbone.Views.CompositeView', ->
  describedClass = SleepingKingStudios.Backbone.Views.CompositeView

  it 'exists', ->
    expect(describedClass).toBeDefined()

  it 'is a Class', ->
    # No way to distinguish Function from Class?
    expect(describedClass).toBeAFunction()

  describe '#parent', ->
    instance = new describedClass

    it 'is a function', ->
      expect(instance).toRespondTo 'parent'

    it 'returns null', ->
      expect(instance.parent()).toBe null

  describe '#children', ->
    instance = new describedClass

    it 'is a function', ->
      expect(instance).toRespondTo 'children'

    it 'returns an empty array', ->
      expect(instance.children()).toEqual []

  describe '#addChild', ->
    instance = null
    child    = null

    beforeEach ->
      instance = new describedClass
      child    = new describedClass { el: $('<span>Child</span>') }

    it 'is a function', ->
      expect(instance).toRespondTo 'addChild'

    it 'sets the child\'s parent', ->
      instance.addChild child
      expect(child.parent()).toBe instance

    it 'appends the child to children', ->
      instance.addChild child
      expect(instance.children()).toContain child

    it 'appends the child\'s element to the root element', ->
      instance.addChild child      
      expect(instance.$el.html()).toEqual '<span>Child</span>'

    describe 'with many children', ->
      children = null

      beforeEach ->
        children = [
          new describedClass { el: $('<span>Child 0</span>') }
          new describedClass { el: $('<span>Child 1</span>') }
          new describedClass { el: $('<span>Child 2</span>') }
        ] # end array

      it 'appends the childrens\' elements to the root element', ->
        instance.addChild child for child in children
        expect(instance.$el.html()).toEqual '<span>Child 0</span><span>Child 1</span><span>Child 2</span>'

  describe '#hasChild', ->
    instance = null
    child    = null

    beforeEach ->
      instance = new describedClass

    it 'is a function', ->
      expect(instance).toRespondTo 'hasChild'

    describe 'with null', ->
      it 'returns false', ->
        expect(instance.hasChild child).toBe false

    describe 'with an unrelated view', ->
      beforeEach ->
        child = new describedClass

      it 'returns false', ->
        expect(instance.hasChild child).toBe false

    describe 'with a child view', ->
      beforeEach ->
        child = new describedClass
        instance.addChild child

      it 'returns true', ->
        expect(instance.hasChild child).toBe true

  describe '#removeChild', ->
    instance = null
    child    = null

    beforeEach ->
      instance = new describedClass
      child    = new describedClass { el: $('<span>Child</span>') }

    it 'is a function', ->
      expect(instance).toRespondTo 'removeChild'

    describe 'with a child element', ->
      beforeEach ->
        instance.addChild child

      it 'sets the child\'s parent to null', ->
        instance.removeChild child
        expect(child.parent()).toBe null

      it 'removes the child from children', ->
        instance.removeChild child
        expect(instance.children()).not.toContain child

      it 'removes the child\'s element from the root element', ->
        instance.removeChild child
        expect(instance.$el.html()).not.toMatch /Child/

    describe 'with an unrelated element', ->
      it 'throws an error', ->
        expect(-> instance.removeChild child).toThrow 'object is not a child of this View'
