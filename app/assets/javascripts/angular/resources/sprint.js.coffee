@Geoticket.factory 'Sprint', ($resource) ->

  $resource(Routes.sprint_path(':id'), {id: '@id'}, {
    active: {method: 'GET', params: {id: 'active'}}
  })

.$inject = ['$resource']