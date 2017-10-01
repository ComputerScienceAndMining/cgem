/*
 * Controller for WorkOrders
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function WorkOrdersIndexCtrl ($log) {
    $log.debug('WorkOrdersIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrdersIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_orders.index', [])
    .controller('WorkOrdersIndexCtrl', WorkOrdersIndexCtrl)
})();
