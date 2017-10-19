/*
 * Controller for Pictures
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function PicturesEditCtrl ($log) {
    $log.debug('PicturesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  PicturesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.pictures.edit', [])
    .controller('PicturesEditCtrl', PicturesEditCtrl)
})();
