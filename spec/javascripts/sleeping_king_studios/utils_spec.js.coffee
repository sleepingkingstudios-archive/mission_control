# spec/javascripts/sleeping_king_studios/utils_spec.js.coffee

#= require 'sleeping_king_studios/utils'

describe 'SleepingKingStudios.utils', ->
  it 'exists', ->
    expect(SleepingKingStudios.utils).toBeDefined()

  describe 'as symbol', ->
    expect(Ω).toBe(SleepingKingStudios.utils)
