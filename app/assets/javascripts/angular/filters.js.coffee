
# If given value is null or undefined it returns 'None'
#
@Geoticket.filter 'showValueOrNone', ->
  (value) ->
    if (_.isNull(value) || _.isUndefined(value)) then 'None' else value

# Converts a number into hours and minutes
#
# @example
#
#   0.5  ~ 0:30
#   1.25 ~ 1:15
#
@Geoticket.filter 'hoursAndMinutes', ->
  (number) ->
    number = String(number)

    # Do not parse any null or string value without a '.' char
    #
    if (number == undefined)
      return null
    else if (number.indexOf('.') == -1)
      return "#{number}:00"

    hours_and_minutes = number.split('.')

    if (hours_and_minutes.length == 1)
      hours_and_minutes[0] + ":00"
    else
      minutes = String(Math.round((parseFloat("0." + hours_and_minutes[1]) * 60)))
      minutes = "0" + minutes if (minutes.length == 1)

      hours_and_minutes[0] + ":" + minutes

# Returns the first 3 letters from given string.
#
#
@Geoticket.filter 'firstLetters', ->
  (value, numberOfLetters) ->
    numberOfLetters = numberOfLetters || 3

    value.substring(0, numberOfLetters)

# Returns given value if different than '0:00'.
#
@Geoticket.filter 'showHoursIfPresent', ->
  (value) ->
    if value != '0:00'
      value
