'use strict'

app = angular.module('app', [
  'ngResource',
  'ngRoute'
])

app.config([
  '$routeProvider', ($routeProvider) ->
    $routeProvider.when('/',  templateUrl: 'js/templates/home.html')
    .when('/companies',       templateUrl: 'js/templates/companies_index.html', controller: CompaniesCtrl)
    .when('/companies/:id',   templateUrl: 'js/templates/companies_detail.html', controller: CompanyCtrl)
    .otherwise(redirectTo: '/')
])

api = ($resource) ->
  companies: $resource('/companies/:id', id: '@id')

app.service('Api', api)