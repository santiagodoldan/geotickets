@Geoticket = angular.module('Geoticket', ['ngResource', 'ui.select2'])

@Geoticket.config ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]