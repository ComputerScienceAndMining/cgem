/*
 * Controller for Parameters
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function ParametersShowCtrl ($log) {
    $log.debug('ParametersShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  ParametersShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.parameters.show', [])
    .controller('ParametersShowCtrl', ParametersShowCtrl)
})();
