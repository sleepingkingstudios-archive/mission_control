# spec/javascripts/sleeping_king_studios/backbone/views/base_view_spec.js.coffee

#= require 'sleeping_king_studios/backbone/views/base_view'

describe 'SleepingKingStudios.Backbone.Views.BaseView', ->
  describedClass = SleepingKingStudios.Backbone.Views.BaseView

  it 'exists', ->
    expect(describedClass).toBeDefined()

  it 'is a Class', ->
    # No way to distinguish Function from Class?
    expect(describedClass).toBeAFunction()

  describe '#finalize', ->
    instance = new describedClass

    it 'is a function', ->
      expect(instance).toRespondTo 'finalize'

    it 'is invoked on #remove()', ->
      spyOn instance, 'finalize'
      instance.remove()
      expect(instance.finalize).toHaveBeenCalled()

  describe 'a subclass', ->
    subClass = class extends describedClass
      customMethod: -> # Do nothing here.

      finalize: ->
        @customMethod()

    describe '#finalize', ->
      instance = new subClass

      it 'is a function', ->
        expect(instance).toRespondTo 'finalize'

      it 'is invoked on #remove()', ->
        spyOn instance, 'customMethod'
        instance.remove()
        expect(instance.customMethod).toHaveBeenCalled()
