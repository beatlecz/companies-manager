CompaniesCtrl = ($scope, Api) ->

  $scope.loadData = ->
    $scope.companies = Api.companies.query()
  $scope.delete = (c) ->
    c.$delete id: c.id, ->
      $scope.loadData()

  $scope.loadData()

CompanyCtrl = ($scope, Api, $routeParams) ->
  if $routeParams.id == 'new'
    $scope.editing = true
    $scope.isNew = true
    $scope.company = new Api.companies()
  else
    $scope.editing = false
    $scope.company = Api.companies.get company_id: $routeParams.company_id

  $scope.editToggle = ->
    $scope.editing = !$scope.editing

  $scope.save = (c) ->
    c.$save id: c.id, ->
      $scope.editing = false