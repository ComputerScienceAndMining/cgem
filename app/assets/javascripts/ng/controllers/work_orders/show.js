/*
 * Controller for WorkOrders
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function WorkOrdersShowCtrl ($log) {
    $log.debug('WorkOrdersShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrdersShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_orders.show', [])
    .controller('WorkOrdersShowCtrl', WorkOrdersShowCtrl)
})();
