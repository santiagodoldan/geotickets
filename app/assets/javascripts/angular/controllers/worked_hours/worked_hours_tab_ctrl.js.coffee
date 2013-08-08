@Geoticket.controller 'WorkedHourTabCtrl', ($scope) ->
  $scope.tabs = []

  addDay = (day) ->
    $scope.tabs[$scope.tabs.length] = {name: day.toString('dddd'), date: day.toString('yyyy-MM-dd')}


  monday = Date.today().previous().monday()

  addDay(monday)

  # Generates tabs from Monday to Friday.
  #
  _(4).times ->
    monday = monday.next().day()
    addDay(monday)

.$inject = ['$scope']