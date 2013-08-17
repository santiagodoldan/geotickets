# Gives the ability to autofocus on a specific element with just
#   adding the ng-focus attribute and assign a variable on current $scope.
#
# @examples
#
#   View:
#     <input ng-focus='focus_now' ng-focus-lost='focus_now=false' />
#
#   Controller:
#     $scope.focus_now = true // to set the focus on above input
#     $scope.focus_now = false // to take away the focus on above input
#
angular.module('ng')
  .directive 'ngFocus', ($timeout) ->

    link: (scope, element, attrs) ->
      scope.$watch attrs.ngFocus, (val) ->
        if (angular.isDefined(val) && val)
          $timeout -> element[0].focus()
      , true

      element.bind 'blur', ->
        if (angular.isDefined(attrs.ngFocusLost))
          scope.$apply(attrs.ngFocusLost)

  .$inject = ['$timeout']
