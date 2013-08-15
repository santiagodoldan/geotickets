@Geoticket.factory 'Sprint', ($resource) ->

  $resource(Routes.sprint_path(':id'), {id: '@id'})

.$inject = ['$resource']