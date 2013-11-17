# spec/javascripts/sleeping_king_studios/utils/function_spec.js.coffee

#= require 'sleeping_king_studios/utils/function'

describe 'SleepingKingStudios.utils.function', ->
  it 'exists', ->
    expect(SleepingKingStudios.utils.function).toBeDefined()

  describe 'shorthand', ->
    it 'is the object', ->
      expect(Ω.fn).toBe(SleepingKingStudios.utils.function)

  describe '#extractOptions', ->
    it 'is a function', ->
      # expect(Ω.fn).toRespondTo 'extractOptions'
      expect(typeof(Ω.fn.extractOptions)).toEqual('function')

    describe 'with an empty array', ->
      ary = []
      [argv, opts] = Ω.fn.extractOptions(ary)

      it 'returns an empty array for arguments', ->
        expect(argv).toEqual([])

      it 'returns an empty object for options', ->
        expect(opts).toEqual({})

    describe 'with an array ending in a non-object', ->
      obj = { key: 'value' }
      ary = [34, 'foo', null, obj, 'nope']
      [argv, opts] = Ω.fn.extractOptions(ary)

      it 'returns the array for arguments', ->
        expect(argv).toEqual(ary)

      it 'returns an empty object for options', ->
        expect(opts).toEqual({})

    describe 'with an array ending in an object', ->
      obj = { key: 'value' }
      ary = [34, 'foo', null, obj]
      [argv, opts] = Ω.fn.extractOptions(ary)

      it 'returns the array minus the last item for arguments', ->
        expect(argv).toEqual ary.slice(0, ary.length - 1)

      it 'returns the last item for options', ->
        expect(opts).toEqual obj
