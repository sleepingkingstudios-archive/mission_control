# spec/javascripts/support/matchers.js.coffee

#= require 'sleeping_king_studios/jasmine/matchers/to_respond_to'

beforeEach ->
  @addMatchers SleepingKingStudios.Jasmine.Matchers
