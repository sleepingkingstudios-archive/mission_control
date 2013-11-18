# spec/javascripts/support/matchers/to_respond_to.js.coffee

#= require 'sleeping_king_studios/jasmine/matchers'

SleepingKingStudios.Jasmine.Matchers.toRespondTo = (expected) ->
  typeof(@actual[expected]) == 'function'
