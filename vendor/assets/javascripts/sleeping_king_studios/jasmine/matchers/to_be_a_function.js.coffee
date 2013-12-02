# vendor/assets/javascripts/sleeping_king_studios/jasmine/matchers/to_be_a_function.js.coffee

#= require 'sleeping_king_studios/jasmine/matchers'

SleepingKingStudios.Jasmine.Matchers.toBeAFunction = (expected) ->
  typeof(@actual) == 'function'
