OwnersCtrl = ($scope, Api, $routeParams, $upload) ->
  $scope.owner = new Api.owners(company_id: $routeParams.company_id)
  $scope.editing = false

  $scope.editToggle = ->
    $scope.editing = !$scope.editing

  $scope.loadData = ->
    $scope.owners = Api.owners.query company_id: $routeParams.company_id

  $scope.fileSelected = ($files) ->
    $scope.attachment = $files[0]

  $scope.delete = (o) ->
    o.$delete ->
      $scope.loadData()
  $scope.save = (o) ->
    o.$save ->
      $upload.upload(
        url: '/companies/' + o.company_id + '/owners/' + o.id + '/attachment'
        file: $scope.attachment
      ).success ( (data) ->
        o.attachment_url = data
        $scope.attachment = null
        $scope.editing = false
        $('#attachment').val('')
      )
      $scope.owners.push o
      $scope.owner = new Api.owners(company_id: $routeParams.company_id)

  unless $routeParams.company_id == 'new'
    $scope.loadData()