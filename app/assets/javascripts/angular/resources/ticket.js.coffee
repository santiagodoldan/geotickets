@Geoticket.factory 'Ticket', ($resource) ->

  $resource(Routes.ticket_path(':id'), {id: '@id'})

.$inject = ['$resource']

@Geoticket.factory 'EpicTicket', ($resource) ->

  $resource(Routes.epic_ticket_path(':story_id', ':id'), {story_id: '@story_id', id: '@id'})

.$inject = ['$resource']
