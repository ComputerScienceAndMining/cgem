/*
 * Controller for WorkOrders
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function WorkOrdersEditCtrl ($log) {
    $log.debug('WorkOrdersEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrdersEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_orders.edit', [])
    .controller('WorkOrdersEditCtrl', WorkOrdersEditCtrl)
})();
