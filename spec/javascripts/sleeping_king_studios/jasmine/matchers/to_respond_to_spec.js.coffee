# spec/javascripts/sleeping_king_studios/jasmine/matchers/to_respond_to_spec.js.coffee

#= require 'sleeping_king_studios/jasmine/matchers/to_respond_to'

describe 'SleepingKingStudios.Jasmine.Matchers.toRespondTo', ->
  matcher = SleepingKingStudios.Jasmine.Matchers.toRespondTo

  it 'is a function', ->
    expect(typeof(matcher)).toEqual('function')

  describe 'with an undefined property', ->
    it 'returns false', ->
      window.actual = {}
      expect(matcher('method')).toBe false

  describe 'with a null property', ->
    it 'returns false', ->
      window.actual = { method: null }
      expect(matcher('method')).toBe false

  describe 'with a true property', ->
    it 'returns false', ->
      window.actual = { method: true }
      expect(matcher('method')).toBe false

  describe 'with a number property', ->
    it 'returns false', ->
      window.actual = { method: -3.14 }
      expect(matcher('method')).toBe false

  describe 'with a string property', ->
    it 'returns false', ->
      window.actual = { method: 'Greetings, programs!' }
      expect(matcher('method')).toBe false

  describe 'with an object property', ->
    it 'returns false', ->
      window.actual = { method: { key: 'value' } }
      expect(matcher('method')).toBe false

  describe 'with a function property', ->
    it 'returns true', ->
      window.actual = { method: -> console.log 'Greetings, program!' }
      expect(matcher('method')).toBe true
