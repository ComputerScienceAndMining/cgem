/*
 * Controller for TestStatuses
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function TestStatusesNewCtrl ($log) {
    $log.debug('TestStatusesNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestStatusesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_statuses.new', [])
    .controller('TestStatusesNewCtrl', TestStatusesNewCtrl)
})();
