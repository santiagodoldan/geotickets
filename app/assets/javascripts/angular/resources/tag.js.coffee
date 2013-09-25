Geoticket.factory 'Tag', ($resource) ->

  return $resource(Routes.tag_path(':id', format: 'json'), {id: '@id'});

.$inject = ['$resource']
