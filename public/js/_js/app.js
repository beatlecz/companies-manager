// Generated by CoffeeScript 1.6.3
'use strict';
var api, app;

app = angular.module('app', ['ngResource', 'ngRoute', 'angularFileUpload']);

app.config([
  '$routeProvider', function($routeProvider) {
    return $routeProvider.when('/companies', {
      templateUrl: 'js/templates/companies_index.html',
      controller: CompaniesCtrl
    }).when('/companies/:company_id', {
      templateUrl: 'js/templates/companies_detail.html',
      controller: CompanyCtrl
    }).otherwise({
      redirectTo: '/companies'
    });
  }
]);

api = function($resource) {
  return {
    companies: $resource('/companies/:company_id', {
      company_id: '@id'
    }),
    owners: $resource('/companies/:company_id/owners/:owner_id', {
      owner_id: '@id',
      company_id: '@company_id'
    }),
    directors: $resource('/companies/:company_id/directors/:owner_id', {
      owner_id: '@id',
      company_id: '@company_id'
    })
  };
};

app.service('Api', api);
