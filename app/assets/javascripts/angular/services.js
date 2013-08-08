
Geoticket.factory('User', ['$resource', function($resource) {

  return $resource(Routes.user_path(':id'), {id: '@id'});

}]);

Geoticket.factory('Tag', ['$resource', function($resource) {

  return $resource(Routes.tag_path(':id'), {id: '@id'});

}]);
