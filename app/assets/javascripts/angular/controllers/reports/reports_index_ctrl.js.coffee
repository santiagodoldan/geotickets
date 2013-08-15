@Geoticket.controller 'ReportsIndexCtrl', ($scope, $route, SprintTicket) ->

  $scope.tickets = SprintTicket.query($route.current.params);

.$inject = ['$scope', '$route', 'SprintTicket']