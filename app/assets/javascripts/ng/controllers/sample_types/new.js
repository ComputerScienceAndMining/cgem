/*
 * Controller for SampleTypes
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SampleTypesNewCtrl ($log) {
    $log.debug('SampleTypesNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_types.new', [])
    .controller('SampleTypesNewCtrl', SampleTypesNewCtrl)
})();
