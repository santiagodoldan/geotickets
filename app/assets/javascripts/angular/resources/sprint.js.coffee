@Geoticket.factory 'Sprint', ($resource) ->

  $resource(Routes.sprint_path(':id', format: 'json'), {id: '@id'}, {
    active: {method: 'GET', params: {id: 'active'}}
  })

.$inject = ['$resource']