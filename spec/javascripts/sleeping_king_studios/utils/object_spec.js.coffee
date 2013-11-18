# spec/javascripts/sleeping_king_studios/utils/object_spec.js.coffee

#= require 'sleeping_king_studios/utils/object'

describe 'SleepingKingStudios.utils.object', ->
  it 'exists', ->
    expect(SleepingKingStudios.utils.object).toBeDefined()

  describe 'shorthand', ->
    it 'is the object', ->
      expect(Ω.obj).toBe(SleepingKingStudios.utils.object)

  describe '#inspect', ->
    it 'is a function', ->
      expect(Ω.obj).toRespondTo 'inspect'

    describe 'shorthand', ->
      it 'is the function', ->
        expect(Ω.inspect).toEqual Ω.obj.inspect

    describe 'with undefined', ->
      it 'returns "undefined"', ->
        expect(Ω.obj.inspect undefined).toEqual 'undefined'

    describe 'with null', ->
      it 'returns "null"', ->
        expect(Ω.obj.inspect null).toEqual 'null'

    describe 'with false', ->
      it 'returns "false"', ->
        expect(Ω.obj.inspect false).toEqual 'false'

    describe 'with true', ->
      it 'returns "true"', ->
        expect(Ω.obj.inspect true).toEqual 'true'

    describe 'with NaN', ->
      it 'returns "NaN"', ->
        expect(Ω.obj.inspect NaN).toEqual 'NaN'

    describe 'with a finite number', ->
      it 'returns the string representation of the number', ->
        expect(Ω.obj.inspect -34.3).toEqual '-34.3'

    describe 'with positive infinity', ->
      it 'returns "Infinity"', ->
        expect(Ω.obj.inspect Number.POSITIVE_INFINITY).toEqual 'Infinity'

    describe 'with negative infinity', ->
      it 'returns "-Infinity"', ->
        expect(Ω.obj.inspect Number.NEGATIVE_INFINITY).toEqual '-Infinity'

    describe 'with a function', ->
      it 'returns "function () {}"',
        expect(Ω.obj.inspect -> {}).toEqual 'function () {}'

    describe 'with a string', ->
      it 'wraps the string in double quotes', ->
        expect(Ω.obj.inspect 'Greetings, program!').toEqual '"Greetings, program!"'

    describe 'with a RegExp', ->
      it 'returns the string representation of the RegExp', ->
        expect(Ω.obj.inspect /^xyzzy/).toEqual '/^xyzzy/'

    describe 'with a Date', ->
      it 'returns the ISO-8601 representation of the Date', ->
        expect(Ω.obj.inspect new Date(Date.UTC(1982, 6, 9))).toEqual '1982-07-09'

      describe 'with a time', ->
        it 'returns the ISO-8601 representation of the Date and time', ->
          expect(Ω.obj.inspect new Date(Date.UTC(1982, 6, 9, 3, 14, 15, 926))).toEqual '1982-07-09T03:14:15.926Z'

    describe 'with an Array', ->
      it 'returns "Array (length #):" and the array elements, indented', ->
        ary = [null, 'foo', 3.14]
        str = 'Array (length 3):\n' +
          '- null\n' +
          '- "foo"\n' +
          '- 3.14'
        expect(Ω.obj.inspect ary).toEqual str

      describe 'with nested Arrays', ->
        it 'returns nested, indented inspect results', ->
          ary = [[0, 1, 2],['alpha','beta','gamma']]
          str = 'Array (length 2):\n' +
            '- Array (length 3):\n' +
            '  - 0\n' +
            '  - 1\n' +
            '  - 2\n' +
            '- Array (length 3):\n' +
            '  - "alpha"\n' +
            '  - "beta"\n' +
            '  - "gamma"'

          expect(Ω.obj.inspect ary).toEqual str

      describe 'with nested Objects', ->
        it 'returns nested, indented inspect results', ->
          ary = [{ foo: 'bar'}, { wibble: 'wobble' }]
          str = 'Array (length 2):\n' +
            '- Object:\n' +
            '  foo: "bar"\n' +
            '- Object:\n' +
            '  wibble: "wobble"'

          expect(Ω.obj.inspect ary).toEqual str

    describe 'with an Object', ->
      it 'returns "Object:" and the key-value pairs, indented', ->
        obj = { key: 'value', foo: null, pi: 3.14 }
        str = 'Object:\n' +
          'key: "value"\n' +
          'foo: null\n' +
          'pi: 3.14'

        expect(Ω.obj.inspect obj).toEqual str

      describe 'with nested Arrays', ->
        it 'returns nested, indented inspect results', ->
          obj = { numbers: [0, 1, 2], greek: ['alpha','beta','gamma'] }
          str = 'Object:\n' +
            'numbers: Array (length 3):\n' +
            '  - 0\n' +
            '  - 1\n' +
            '  - 2\n' +
            'greek: Array (length 3):\n' +
            '  - "alpha"\n' +
            '  - "beta"\n' +
            '  - "gamma"'

          expect(Ω.obj.inspect obj).toEqual str

      describe 'with nested Objects', ->
        it 'returns nested, indented inspect results', ->
          obj = { hash: { key: 'value' } }
          str = 'Object:\n' +
            'hash: Object:\n' +
            '  key: "value"'

          expect(Ω.obj.inspect obj).toEqual str

        describe 'with deeply nested Objects', ->
          it 'returns nested, indented inspect results', ->
            obj = {
              swords: {
                japanese: {
                  short: 'shoto',
                  long:  'daito'
                }, # end object
                german: {
                  long:  'zweihänder'
                } # end object
              }, # end object
              bows: {
                foot:  'longbow',
                horse: 'composite shortbow'
              } # end object
            } # end object
            str = 'Object:\n' +
              'swords: Object:\n' +
              '  japanese: Object:\n' +
              '    short: "shoto"\n' +
              '    long: "daito"\n' +
              '  german: Object:\n' +
              '    long: "zweihänder"\n' +
              'bows: Object:\n' +
              '  foot: "longbow"\n' +
              '  horse: "composite shortbow"'

            expect(Ω.obj.inspect obj).toEqual str

  describe '#isDataObject', ->
    it 'is a function', ->
      expect(Ω.obj).toRespondTo 'inspect'

    describe 'with undefined', ->
      it 'returns false', ->
        expect(Ω.obj.isDataObject(undefined)).toBe(false)

    describe 'with null', ->
      it 'returns false', ->
        expect(Ω.obj.isDataObject(null)).toBe(false)

    describe 'with false', ->
      it 'returns false', ->
        expect(Ω.obj.isDataObject(false)).toBe(false)

    describe 'with true', ->
      it 'returns false', ->
        expect(Ω.obj.isDataObject(true)).toBe(false)

    describe 'with a number', ->
      it 'returns false', ->
        expect(Ω.obj.isDataObject(3.141)).toBe(false)

    describe 'with an empty object', ->
      it 'returns true', ->
        expect(Ω.obj.isDataObject({})).toBe(true)

    describe 'with a non-empty object', ->
      value = {
        int: 34,
        str: 'foo',
        hsh: { key: 'value' },
        fn: ->
          'Greetings, programs!'
      } # end object

      it 'returns true', ->
        expect(Ω.obj.isDataObject(value)).toBe(true)

    describe 'with an empty array', ->
      it 'returns false', ->
        expect(Ω.obj.isDataObject([])).toBe(false)

    describe 'with a non-empty array', ->
      value = [34, 'foo', { key: 'value' }]
      it 'returns false', ->
        expect(Ω.obj.isDataObject(value)).toBe(false)
