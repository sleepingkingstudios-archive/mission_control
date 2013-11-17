# spec/javascripts/sleeping_king_studios/jasmine/matchers/to_respond_to_spec.js.coffee

describe '#toRespondTo()', ->
  actual = {}

  it 'is a function', ->
    expect(typeof(expect().toRespondTo)).toEqual('function')

  describe 'with null', ->
    expected = null

    xit 'returns false', ->
      null
      # console.log expect(actual).toRespondTo(expected)
      # for k, v of @results().getItems()
      #   console.log k
      #   console.log v
