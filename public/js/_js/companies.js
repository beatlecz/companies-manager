// Generated by CoffeeScript 1.6.3
var CompaniesCtrl, CompanyCtrl;

CompaniesCtrl = function($scope, Api) {
  return $scope.companies = Api.companies.query(function() {});
};

CompanyCtrl = function($scope, Api) {};