'use strict'

app = angular.module('app', [
  'ngResource',
  'ngRoute'
])

app.config([
  '$routeProvider', ($routeProvider) ->
    $routeProvider.when('/',  templateUrl: 'home.html')
    .when('/companies',       templateUrl: 'company_index.html')
    .when('/companies/:id',   templateUrl: 'company_detail.html')
    .otherwise(redirectTo: '/')
])

api = ($resource) ->
  companies: $resource('/companies/:id', id: '@id')

app.service('Api', api)