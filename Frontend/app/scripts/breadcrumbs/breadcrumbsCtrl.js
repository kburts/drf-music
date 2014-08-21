'use strict';

angular
  .module('playlistApp')
  .controller('BreadcrumbsCtrl', BreadcrumbsCtrl);

function BreadcrumbsCtrl($location, $log, $scope) {
  var vm = this;
  
  $scope.$on('$routeChangeSuccess', function () {
    createBreadcrumbs();
  })

  function createBreadcrumbs() {
    vm.breadcrumbs = []
    var currpath = $location.path().split("/")

    var home = {};
    home.name = "home";
    home.url = "/";
    vm.breadcrumbs.push(home);
    for (var i=1; i < currpath.length; i++) {
      var item = {};
      item.name = currpath[i];
      item.url = getItemUrl(currpath.slice(0,i+1));
      vm.breadcrumbs.push(item);
    };
    return vm.breadcrumbs;
  };

  function getItemUrl(arr) {
    return "/#" + arr.join().replace(/,/g,"/"); // Replace all ,'s with /'s.
  };
};