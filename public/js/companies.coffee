CompaniesCtrl = ($scope, Api) ->

  $scope.loadData = ->
    $scope.companies = Api.companies.query()
  $scope.delete = (c) ->
    c.$delete ->
      $scope.loadData()

  $scope.loadData()

CompanyCtrl = ($scope, Api, $routeParams, $location) ->
  if $routeParams.company_id == 'new'
    $scope.editing = true
    $scope.isNew = true
    $scope.company = new Api.companies()
  else
    $scope.editing = false
    $scope.company = Api.companies.get company_id: $routeParams.company_id

  $scope.editToggle = ->
    $scope.editing = !$scope.editing

  $scope.save = (c) ->
    c.$save ->
      $location.path '/companies/' + c.id
