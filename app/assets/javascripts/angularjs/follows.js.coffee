@FollowsCtrl = ['$scope', '$http', '$location', ($scope, $http, $location) ->
  $scope.init = (data) ->
    [$scope.count, $scope.labels, $scope.followed] = data
    $scope.disabled = !$scope.user?
    if $scope.disabled
      $scope.href = "/users/sign_in"
  $scope.follow = ->
    return if $scope.disabled
    $scope.followed = !$scope.followed
    action = if $scope.followed then 'follow' else 'unfollow'
    $http.post("/books/#{$scope.book.id}/#{action}").success (data) -> $scope.count = data.count
]
