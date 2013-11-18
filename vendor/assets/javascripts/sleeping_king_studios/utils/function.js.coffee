# vendor/assets/javascripts/sleeping_king_studios/utils/function.js.coffee

#= require 'sleeping_king_studios/utils'
#= require 'sleeping_king_studios/utils/object'

SleepingKingStudios.utils.function = {
  extractOptions: (argv) ->
    if Ω.obj.isDataObject(_.last(argv))
      [ argv.slice(0, argv.length - 1),
        _.last(argv)
      ] # end array
    else
      [ argv, {} ]
} # end object

Ω.fn = SleepingKingStudios.utils.function
