/*
 * Controller for WorkOrderStatuses
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function WorkOrderStatusesEditCtrl ($log) {
    $log.debug('WorkOrderStatusesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrderStatusesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_order_statuses.edit', [])
    .controller('WorkOrderStatusesEditCtrl', WorkOrderStatusesEditCtrl)
})();
