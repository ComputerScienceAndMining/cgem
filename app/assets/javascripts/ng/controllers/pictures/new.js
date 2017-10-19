/*
 * Controller for Pictures
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function PicturesNewCtrl ($log) {
    $log.debug('PicturesNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  PicturesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.pictures.new', [])
    .controller('PicturesNewCtrl', PicturesNewCtrl)
})();
