// Generated by CoffeeScript 1.6.3
var CompaniesCtrl, CompanyCtrl;

CompaniesCtrl = function($scope, Api) {
  return $scope.companies = Api.companies.query();
};

CompanyCtrl = function($scope, Api, $routeParams, $log) {
  if ($routeParams.id === 'new') {
    $scope.editing = true;
    $scope.title = 'New company';
    $scope.company = new Api.companies();
  } else {
    $scope.editing = false;
    $scope.company = Api.companies.get({
      id: $routeParams.id
    });
    $log.info($scope.company);
  }
  $scope.editToggle = function() {
    return $scope.editing = !$scope.editing;
  };
  return $scope.save = function(c) {
    return c.$save({
      id: c.id
    }, function() {
      return $scope.editing = false;
    });
  };
};
