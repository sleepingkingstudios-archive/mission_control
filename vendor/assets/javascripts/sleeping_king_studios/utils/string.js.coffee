# vendor/assets/javascripts/sleeping_king_studios/utils/string.js.coffee

#= require 'sleeping_king_studios/utils'

SleepingKingStudios.utils.string = {
  indent: (str, opts) ->
    opts ||= {}
    _.defaults(opts, {
      by:            2,
      char:          ' ',
      skipFirstLine: false
    }) # end defaults

    lines  = []
    prefix = _.map(_.range(0, opts['by']), => opts['char']).join('')

    for line, index in @lines(str)
      if 0 == index and opts['skipFirstLine']
        lines[index] = line
      else
        lines[index] = "#{prefix}#{line}"

    lines.join('\n')

  lines: (str) ->
    str.split(/\n/)
} # end object

Ω.str = SleepingKingStudios.utils.string
