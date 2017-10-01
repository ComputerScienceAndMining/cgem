/*
 * Controller for WorkOrderStatuses
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function WorkOrderStatusesIndexCtrl ($log) {
    $log.debug('WorkOrderStatusesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrderStatusesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_order_statuses.index', [])
    .controller('WorkOrderStatusesIndexCtrl', WorkOrderStatusesIndexCtrl)
})();
