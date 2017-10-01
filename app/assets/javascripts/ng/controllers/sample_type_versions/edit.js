/*
 * Controller for SampleTypeVersions
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SampleTypeVersionsEditCtrl ($log) {
    $log.debug('SampleTypeVersionsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypeVersionsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_type_versions.edit', [])
    .controller('SampleTypeVersionsEditCtrl', SampleTypeVersionsEditCtrl)
})();
