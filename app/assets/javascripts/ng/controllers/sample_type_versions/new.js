/*
 * Controller for SampleTypeVersions
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SampleTypeVersionsNewCtrl ($log) {
    $log.debug('SampleTypeVersionsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypeVersionsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_type_versions.new', [])
    .controller('SampleTypeVersionsNewCtrl', SampleTypeVersionsNewCtrl)
})();
