'use strict'

app = angular.module('app', [
  'ngResource',
  'ngRoute'
])

app.config([
  '$routeProvider', ($routeProvider) ->
    $routeProvider.when('/',  template: 'home')
    .when('/companies',       template: 'company/index')
    .when('/companies/:id',   template: 'company/detail')
    .otherwise(redirectTo: '/')
])

api = ($resource) ->
  companies: $resource('/companies/:id', id: '@id')

app.service('Api', api)