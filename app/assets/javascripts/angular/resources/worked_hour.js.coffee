#
# REST /worked_hours
#
@Geoticket.factory 'WorkedHour', ($resource) ->

  $resource(Routes.worked_hour_path(':id/:action', format: 'json'), {id: '@id'}, {
    extra: {method: 'GET', params: {action: 'extra'}, isArray: true},
    hours_by_day: {method: 'GET', params: {action: 'hours_by_day'}},
    update: {method: 'PUT'}
  })

.$inject = ['$resource']
