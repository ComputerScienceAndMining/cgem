/*
 * Controller for SampleTypeVersions
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SampleTypeVersionsIndexCtrl ($log) {
    $log.debug('SampleTypeVersionsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SampleTypeVersionsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.sample_type_versions.index', [])
    .controller('SampleTypeVersionsIndexCtrl', SampleTypeVersionsIndexCtrl)
})();
