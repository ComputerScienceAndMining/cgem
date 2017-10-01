/*
 * Controller for SampleTypeVersions
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SampleTypeVersionsShowCtrl ($log) {
    $log.debug('SampleTypeVersionsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypeVersionsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_type_versions.show', [])
    .controller('SampleTypeVersionsShowCtrl', SampleTypeVersionsShowCtrl)
})();
