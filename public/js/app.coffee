'use strict'

app = angular.module('app', [
  'ngResource',
  'ngRoute',
  'angularFileUpload'
])

app.config([
  '$routeProvider', ($routeProvider) ->
    $routeProvider.when('/',  templateUrl: 'js/templates/home.html')
    .when('/companies',       templateUrl: 'js/templates/companies_index.html', controller: CompaniesCtrl)
    .when('/companies/:company_id',   templateUrl: 'js/templates/companies_detail.html', controller: CompanyCtrl)
    .otherwise(redirectTo: '/')
])

api = ($resource) ->
  companies:    $resource '/companies/:company_id', company_id: '@id'
  owners:       $resource '/companies/:company_id/owners/:owner_id', { owner_id: '@id', company_id: '@company_id' }
  directors:    $resource '/companies/:company_id/directors/:owner_id', { owner_id: '@id', company_id: '@company_id' }
  attachments:  $resource '/companies/:company_id/directors/:owner_id/attachments', { owner_id: '@id', company_id: '@company_id' }
app.service('Api', api)