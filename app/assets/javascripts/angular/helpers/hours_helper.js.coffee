
@Geoticket.factory 'hours', ->

  splitHours = (hours) ->
    if hours == undefined
      return []
    else
      return hours.split(':')

  convertNumber: (number) ->
    time = splitHours(number);

    if time.length == 1
      return parseFloat(time[0]);
    else
      return parseFloat(time[0]) + (parseFloat(time[1]) / 60);
