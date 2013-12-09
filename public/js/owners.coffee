OwnersCtrl = ($scope, Api, $routeParams, $upload) ->
  $scope.owner = new Api.owners(company_id: $routeParams.company_id)
  $scope.loadData = ->
    $scope.owners = Api.owners.query company_id: $routeParams.company_id

  $scope.fileSelected = ($files) ->
    $scope.attachment = $files[0]

  $scope.delete = (o) ->
    o.$delete ->
      $scope.loadData()
  $scope.save = (o) ->
    o.$save ->
      $upload.upload
        url: '/companies/' + o.company_id + '/owners/' + o.id + '/attachments'
        file: $scope.attachment
      o = new Api.owners(company_id: $routeParams.company_id)
      $scope.loadData()


  $scope.loadData()