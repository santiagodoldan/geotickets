#
# REST /worked_hours
#
@Geoticket.factory 'WorkedHour', ($resource) ->

  $resource(Routes.worked_hour_path(':id', format: 'json'), {id: '@id'})

.$inject = ['$resource']

#
# REST /sprints/:sprint_id/worked_hours
#
@Geoticket.factory 'SprintWorkedHour', ($resource) ->

  $resource(Routes.sprint_worked_hours_path(':sprint_id', format: 'json'))

.inject = ['$resource']