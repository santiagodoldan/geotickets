@Geoticket.factory 'User', ($resource) ->

  $resource(Routes.user_path(':id', format: 'json'), {id: '@id'})

.$inject = ['$resource']