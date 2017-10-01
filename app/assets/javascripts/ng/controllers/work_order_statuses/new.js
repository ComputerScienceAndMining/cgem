/*
 * Controller for WorkOrderStatuses
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function WorkOrderStatusesNewCtrl ($log) {
    $log.debug('WorkOrderStatusesNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrderStatusesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_order_statuses.new', [])
    .controller('WorkOrderStatusesNewCtrl', WorkOrderStatusesNewCtrl)
})();
