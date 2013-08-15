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
@Geoticket = angular.module('Geoticket', ['ngResource', 'ngCookies', 'ui.select2', 'ui.bootstrap', '$strap.directives'])

# Allows HTML5 history enabled if possible otherwise
#   would use hashbang behaviour.
#
@Geoticket.config ($locationProvider, $httpProvider) ->
  $locationProvider.html5Mode(true)

  # Check on every request if an HTTP 401 was receive to redirect
  #   the user to the login page.
  #
  logsOutUserOn401 = ($q, $location) ->
    success = (response) ->
      response

    error = (response) ->
      if (response.status == 401)
        # redirect them back to login page
        $location.path('/login')

        $q.reject(response)
      else
        $q.reject(response)

    (promise) ->
      promise.then(success, error)

  logsOutUserOn401.$inject = ['$q', '$location']

  $httpProvider.responseInterceptors.push(logsOutUserOn401)

.$inject = ['$locationProvider', '$httpProvider']

# Checks if current user is already logged in.
#
@Geoticket.run ($cookies, $location, UserAuth) ->

  if $cookies.user_id
    UserAuth.setData($cookies.user_id, $cookies.username)
  else
    $location.path('/login')

.$inject = ['$cookies', '$location', 'UserAuth']