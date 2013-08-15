# Current user data.
#
@Geoticket.service 'UserAuth', ($http, $location, $cookies) ->

  @authenticated = false
  @username = null
  @user_id = null

  isAuthenticated: => @authenticated
  getName: => @username
  getId: => @user_id

  setData: (user_id, username) =>
    @username= username
    @user_id= user_id
    @authenticated= true

  # Log in given user.
  #
  login: (user_id) =>
    $http.post(Routes.login_user_path(user_id)).success (data) =>
      @username= data.name
      @user_id= data.id
      @authenticated= true

      $location.path('/')

  # Log out current user.
  #
  logout: =>
    $http.delete(Routes.logout_users_path()).success =>
      @username= null
      @user_id= null
      @authenticated= false

      $location.path('/login')

.$inject = ['$http', '$location', '$cookies']

