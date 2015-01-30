function ServicesCtrl($scope, $http) {
    console.log("Hello From ServicesCtrl");
    $scope.message = "Hello from controller";

    $scope.create = function () {
        console.log($scope.serviceClient);
        $http.post("/serviceClients", $scope.serviceClient)
        .success(function (response) {
            $scope.all();
        });
    }

    $scope.renderServiceClients = function (response) {
        $scope.serviceClients = response;
    };

    $scope.remove = function (id) {
        $http.delete("/serviceClients/" + id)
        .success(function (response) {
            $scope.all();
        });
    };

    $scope.update = function () {
        console.log($scope.serviceClient);
        $http.put("/serviceClients/" + $scope.serviceClient._id, $scope.serviceClient)
        .success(function (response) {
            $scope.all();
        });
    };

    $scope.select = function (id) {
        console.log(id);
        $http.get("/serviceClients/" + id)
        .success(function (response) {
            console.log(response);
            $scope.serviceClient = response;
        });
    };

    //get all. Declarations have to be ordered
    $scope.all = function () {
        $http.get("/serviceClients")
        .success($scope.renderServiceClients); //After changed, it notify the UI about the changes
    }

    $scope.all();
}