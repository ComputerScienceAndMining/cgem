/*
 * Controller for Specimens
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimensEditCtrl ($log) {
    $log.debug('SpecimensEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimensEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.edit', [])
    .controller('SpecimensEditCtrl', SpecimensEditCtrl)
})();
