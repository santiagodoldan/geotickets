
/**
 * Allows HTML5 history to prevent using hashbang
 *   functionality when HTML5 is available.
 */

window.Geoticket = angular.module('Geoticket', ['ngResource', 'ui.select2']).
  config(['$locationProvider', function($location) {
    $location.html5Mode(true)
  }]);
