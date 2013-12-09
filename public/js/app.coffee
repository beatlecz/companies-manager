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
  companies: $resource  '/companies/:id', id: '@id'
  owners: $resource     '/companies/:company_id/owners/:id', { id: '@id', company_id: '@company_id' }
  directors: $resource  '/companies/:company_id/directors/:id', { id: '@id', company_id: '@company_id' }

app.service('Api', api)