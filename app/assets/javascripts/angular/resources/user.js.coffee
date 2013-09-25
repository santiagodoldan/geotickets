Geoticket.factory 'User', ($resource) ->

  return $resource(Routes.user_path(':id', format: 'json'), {id: '@id'});

.$inject = ['$resource']