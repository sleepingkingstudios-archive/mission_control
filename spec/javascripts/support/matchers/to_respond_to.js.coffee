# spec/javascripts/support/matchers/to_respond_to.js.coffee

beforeEach ->
  @addMatchers {
    toRespondTo: () ->
      false
  }
