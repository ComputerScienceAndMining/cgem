/*
 * Controller for Parameters
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function ParametersNewCtrl ($log) {
    $log.debug('ParametersNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  ParametersNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.parameters.new', [])
    .controller('ParametersNewCtrl', ParametersNewCtrl)
})();
