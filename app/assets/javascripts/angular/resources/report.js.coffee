@Geoticket.factory 'Report', ($resource) ->

  $resource(Routes.sprint_report_path(':sprint_id', ':id', format: 'json'), {sprint_id: '@sprint_id', id: '@id'}, {
    breakdown: {method: 'GET', params: {id: 'breakdown'}}
  })

.$inject = ['$resource']