/*
 * Controller for Parameters
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function ParametersIndexCtrl ($log) {
    $log.debug('ParametersIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  ParametersIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.parameters.index', [])
    .controller('ParametersIndexCtrl', ParametersIndexCtrl)
})();
