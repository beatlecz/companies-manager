CompaniesCtrl = ($scope, Api) ->

  loadData = ->
    $scope.companies = Api.companies.query()
  $scope.delete = (c) ->
    c.$delete id: c.id, ->
      loadData()

  loadData()

CompanyCtrl = ($scope, Api, $routeParams,$log) ->
  if $routeParams.id == 'new'
    $scope.editing = true
    $scope.isNew = true
    $scope.company = new Api.companies()
  else
    $scope.editing = false
    $scope.company = Api.companies.get(id: $routeParams.id)
    $log.info $scope.company

  $scope.editToggle = ->
    $scope.editing = !$scope.editing

  $scope.save = (c) ->
    c.$save id: c.id, ->
      $scope.editing = false