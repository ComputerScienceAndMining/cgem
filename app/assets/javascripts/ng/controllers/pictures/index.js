/*
 * Controller for Pictures
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function PicturesIndexCtrl ($log) {
    $log.debug('PicturesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  PicturesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.pictures.index', [])
    .controller('PicturesIndexCtrl', PicturesIndexCtrl)
})();
