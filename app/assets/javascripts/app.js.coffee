# Angular's main module App.
#
# Dependencies
#
#   ngResource
#     allows and provides an elegant way of creating RESTfull services.
#
#   ui.select2
#     provides a directive to create searchable selectors.
#
#   ui.bootstrap
#     provides bootstrap components as angular directives.
#
@Geoticket = angular.module('Geoticket', ['ngResource', 'ui.select2', 'ui.bootstrap'])

# Allows HTML5 history enabled if possible otherwise
#   would use hashbang behaviour.
#
@Geoticket.config ($locationProvider) ->
  $locationProvider.html5Mode(true)

.$inject = ['$locationProvider']