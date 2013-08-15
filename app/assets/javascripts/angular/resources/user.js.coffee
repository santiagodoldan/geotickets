Geoticket.factory 'User', ($resource) ->

  return $resource(Routes.user_path(':id'), {id: '@id'});

.$inject = ['$resource']