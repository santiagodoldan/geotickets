#
#
#
@Geoticket.factory 'Ticket', ($resource) ->

  $resource(Routes.story_ticket_path(':story_id', ':id'), {story_id: '@story_id', id: '@id'})

.$inject = ['$resource']

#
#
#
@Geoticket.factory 'SprintTicket', ($resource) ->

  $resource(Routes.sprint_tickets_path(':sprint_id'))

.$inject = ['$resource']