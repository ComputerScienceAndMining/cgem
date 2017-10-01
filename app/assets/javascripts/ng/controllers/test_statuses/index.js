/*
 * Controller for TestStatuses
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function TestStatusesIndexCtrl ($log) {
    $log.debug('TestStatusesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  TestStatusesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.test_statuses.index', [])
    .controller('TestStatusesIndexCtrl', TestStatusesIndexCtrl)
})();
