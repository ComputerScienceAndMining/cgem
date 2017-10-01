/*
 * Controller for Parameters
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function ParametersEditCtrl ($log) {
    $log.debug('ParametersEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  ParametersEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.parameters.edit', [])
    .controller('ParametersEditCtrl', ParametersEditCtrl)
})();
