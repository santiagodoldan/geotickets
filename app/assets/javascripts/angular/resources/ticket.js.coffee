# Ticket RESTfull actions.
#   Also added $update function.
#
@Geoticket.factory 'Ticket', ($resource) ->

  $resource(Routes.story_ticket_path(':story_id', ':id', format: 'json'), {story_id: '@story_id', id: '@id'}, {
    update: {method: 'PUT'}
  })

.$inject = ['$resource']

# SprintTicket RESTfull actions.
#   Given a sprint returns all the associated tickets.
#
@Geoticket.factory 'SprintTicket', ($resource) ->

  $resource(Routes.sprint_tickets_path(':sprint_id', format: 'json'))

.$inject = ['$resource']
