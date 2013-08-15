Geoticket.factory 'Tag', ($resource) ->

  return $resource(Routes.tag_path(':id'), {id: '@id'});

.$inject = ['$resource']
