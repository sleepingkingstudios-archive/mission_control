# vendor/assets/javascripts/sleeping_king_studios/utils/object.js.coffee

#= require 'sleeping_king_studios/utils'

SleepingKingStudios.utils.object = {
  inspect: (obj) ->
    if _.isUndefined(obj)
      return 'undefined'
    else if _.isNull(obj)
      return 'null'
    else if _.isFunction(obj)
      return 'function () {}'
    else if _.isDate(obj)
      raw = obj.toISOString()
      [date, time] = raw.split('T')
      if time.substring(0, time.length - 1).match(/[1-9]/)
        return raw
      else
        return date
    else if _.isRegExp(obj)
      return obj.toString()
    else if _.isString(obj)
      return "\"#{obj}\""
    else if _.isArray(obj)
      str = "Array (length #{obj.length}):"
      for item in obj
        str += "\n#{Ω.str.indent("- #{@inspect(item)}", { skipFirstLine: true }) }"
      return str
    else if _.isObject(obj)
      str = "Object:"
      for key, value of obj
        str += "\n#{Ω.str.indent("#{key}: #{@inspect(value)}", { skipFirstLine: true }) }"
      return str
    else
      return obj.toString()

  isDataObject: (obj) ->
    _.isObject(obj) and not _.isArray(obj)
} # end object

Ω.obj     = SleepingKingStudios.utils.object
Ω.inspect = SleepingKingStudios.utils.object.inspect
