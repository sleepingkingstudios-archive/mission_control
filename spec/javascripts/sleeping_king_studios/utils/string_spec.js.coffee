# spec/javascripts/sleeping_king_studios/utils/string_spec.js.coffee

#= require 'sleeping_king_studios/utils/string'

describe 'SleepingKingStudios.utils.string', ->
  it 'exists', ->
    expect(SleepingKingStudios.utils.string).toBeDefined()

  describe 'shorthand', ->
    it 'is the object', ->
      expect(Ω.str).toBe(SleepingKingStudios.utils.string)

  describe '#indent', ->
    it 'is a function', ->
      expect(Ω.str).toRespondTo 'indent'

    describe 'with a single-line string', ->
      str = "I want to be the very best, like no one ever was!"

      it 'returns the indented string', ->
        mod = "  I want to be the very best, like no one ever was!"

        expect(Ω.str.indent str).toEqual(mod)

      describe 'with an indent by', ->
        it 'returns the indented string', ->
          mod  = "    I want to be the very best, like no one ever was!"
          opts = { by: 4 }

          expect(Ω.str.indent str, opts).toEqual(mod)

      describe 'with a char', ->
        it 'returns the indented string', ->
          mod  = "++I want to be the very best, like no one ever was!"
          opts = { char: '+' }

          expect(Ω.str.indent str, opts).toEqual(mod)

      xdescribe 'with a long char string'

      xdescribe 'with a char function'

      describe 'with skipFirstLine', ->
        it 'returns the unmodified string', ->
          mod  = "I want to be the very best, like no one ever was!"
          opts = { skipFirstLine: true }

          expect(Ω.str.indent str, opts).toEqual(mod)

    describe 'with a multi-line string', ->
      str = "Everybody wants to be a master,\n" +
            "Everybody wants to show their skills,\n" +
            "Everybody wants to get there faster,\n" +
            "Make their way to the top of the hill."

      it 'returns the indented string', ->
        mod = "  Everybody wants to be a master,\n" +
              "  Everybody wants to show their skills,\n" +
              "  Everybody wants to get there faster,\n" +
              "  Make their way to the top of the hill."

        expect(Ω.str.indent str).toEqual(mod)

      describe 'with an indent by', ->
        it 'returns the indented string', ->
          mod = "    Everybody wants to be a master,\n" +
                "    Everybody wants to show their skills,\n" +
                "    Everybody wants to get there faster,\n" +
                "    Make their way to the top of the hill."
          opts = { by: 4 }

          expect(Ω.str.indent str, opts).toEqual(mod)

      describe 'with a char', ->
        it 'returns the indented string', ->
          mod = "++Everybody wants to be a master,\n" +
                "++Everybody wants to show their skills,\n" +
                "++Everybody wants to get there faster,\n" +
                "++Make their way to the top of the hill."
          opts = { char: '+' }

          expect(Ω.str.indent str, opts).toEqual(mod)

      xdescribe 'with a long char string'

      xdescribe 'with a char function'

      describe 'with skipFirstLine', ->
        it 'returns the string with the first line unmodified and the remaining lines indented', ->
          mod = "Everybody wants to be a master,\n" +
                "  Everybody wants to show their skills,\n" +
                "  Everybody wants to get there faster,\n" +
                "  Make their way to the top of the hill."
          opts = { skipFirstLine: true }

          expect(Ω.str.indent str, opts).toEqual(mod)

  describe '#lines', ->
    it 'is a function', ->
      expect(Ω.string).toRespondTo 'lines'

    describe 'with a single-line string', ->
      str = "I want to be the very best, like no one ever was!"
      ary = [str]

      it 'wraps the string in an array', ->
        expect(Ω.str.lines str).toEqual(ary)

    describe 'with a multi-line string', ->
      str = "Everybody wants to be a master,\n" +
            "Everybody wants to show their skills,\n" +
            "Everybody wants to get there faster,\n" +
            "Make their way to the top of the hill."
      ary = [ "Everybody wants to be a master,",
              "Everybody wants to show their skills,",
              "Everybody wants to get there faster,",
              "Make their way to the top of the hill."
            ] # end array

      it 'splits the string on line breaks', ->
        expect(Ω.str.lines str).toEqual(ary)
