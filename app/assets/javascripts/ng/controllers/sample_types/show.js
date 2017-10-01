/*
 * Controller for SampleTypes
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SampleTypesShowCtrl ($log) {
    $log.debug('SampleTypesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_types.show', [])
    .controller('SampleTypesShowCtrl', SampleTypesShowCtrl)
})();
