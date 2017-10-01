/*
 * Controller for WorkOrders
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function WorkOrdersNewCtrl ($log) {
    $log.debug('WorkOrdersNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  WorkOrdersNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.work_orders.new', [])
    .controller('WorkOrdersNewCtrl', WorkOrdersNewCtrl)
})();
