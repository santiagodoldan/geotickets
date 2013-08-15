@Geoticket.factory 'WorkedHour', ($resource) ->

  return $resource(Routes.worked_hour_path(':id'), {id: '@id'})

.$inject = ['$resource']