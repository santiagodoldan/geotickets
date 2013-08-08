# Story RESTfull actions.
#
@Geoticket.factory 'Story', ($resource) ->

  $resource(Routes.epic_path(':id'), {id: '@id'});

.$inject = ['$resource']