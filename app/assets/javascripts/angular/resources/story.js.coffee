# Story RESTfull actions.
#
@Geoticket.factory 'Story', ($resource) ->

  $resource(Routes.sprint_story_path(':sprint_id', ':id', format: 'json'), {sprint_id: '@sprint_id', id: '@id'}, {
    update: {method: 'PUT'}
  });

.$inject = ['$resource']