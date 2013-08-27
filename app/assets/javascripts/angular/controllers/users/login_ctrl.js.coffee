# User login page.
#
@Geoticket.controller 'LoginCtrl', ($scope, $http, $location, User, UserAuth) ->

  # List of users to be logged in as.
  #
  $scope.users= User.query()

  # When a new user is selected it would be logged in as that user.
  #
  $scope.$watch 'user_id', ->
    if $scope.user_id
      UserAuth.login $scope.user_id, ->
        # Emit to parent's controllers.
        #
        $scope.$emit('USER_STATUS', true)

.$inject = ['$scope', '$http', '$location', 'User', 'UserAuth']
