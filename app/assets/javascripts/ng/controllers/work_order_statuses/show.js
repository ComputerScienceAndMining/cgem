/*
 * Controller for WorkOrderStatuses
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function WorkOrderStatusesShowCtrl ($log) {
    $log.debug('WorkOrderStatusesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrderStatusesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_order_statuses.show', [])
    .controller('WorkOrderStatusesShowCtrl', WorkOrderStatusesShowCtrl)
})();
