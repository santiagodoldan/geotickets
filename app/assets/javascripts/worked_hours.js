$(function() {
  $('.datepicker').datepicker({'dateFormat': 'yy-mm-dd'});
});

function WorkedHoursCtrl($scope) {

  $scope.disabled= false;

  var splitHours = function(hours) {
    if (hours === undefined)
      return [];
    else
      return hours.split(':');
  };

  $scope.convertToNumber = function() {
    var time = splitHours($scope.amount);

    if (time.length == 1)
      return parseFloat(time[0]);
    else
      return parseFloat(time[0]) + (parseFloat(time[1]) / 60);
  };

  $scope.submit = function() {
    $scope.disabled= true;
  };

}