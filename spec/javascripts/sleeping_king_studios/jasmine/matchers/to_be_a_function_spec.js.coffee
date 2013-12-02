# spec/javascripts/sleeping_king_studios/jasmine/matchers/to_be_a_function_spec.js.coffee

#= require 'sleeping_king_studios/jasmine/matchers/to_be_a_function'

describe 'SleepingKingStudios.Jasmine.Matchers.toBeAFunction', ->
  matcher = SleepingKingStudios.Jasmine.Matchers.toBeAFunction

  it 'is a function', ->
    expect(typeof(matcher)).toEqual('function')

  describe 'with undefined', ->
    it 'returns false', ->
      window.actual = undefined
      expect(matcher()).toBe false

  describe 'with null', ->
    it 'returns false', ->
      window.actual = null
      expect(matcher()).toBe false

  describe 'with an object', ->
    it 'returns false', ->
      window.actual = {}
      expect(matcher()).toBe false

  describe 'with a function', ->
    it 'returns true', ->
      window.actual = -> undefined
      expect(matcher()).toBe true

  describe 'with a class', ->
    it 'returns true', ->
      window.actual = class
        foo: -> 'bar'
      expect(matcher()).toBe true
