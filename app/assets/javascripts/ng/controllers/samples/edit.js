/*
 * Controller for Samples
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SamplesEditCtrl ($log) {
    $log.debug('SamplesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})

    console.log(vm.data)
  }

  // Inject dependencies
  SamplesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.edit', [])
    .controller('SamplesEditCtrl', SamplesEditCtrl)
})();
