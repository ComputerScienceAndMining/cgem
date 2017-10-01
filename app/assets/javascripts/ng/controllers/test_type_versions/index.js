/*
 * Controller for TestTypeVersions
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function TestTypeVersionsIndexCtrl ($log) {
    $log.debug('TestTypeVersionsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestTypeVersionsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_type_versions.index', [])
    .controller('TestTypeVersionsIndexCtrl', TestTypeVersionsIndexCtrl)
})();
