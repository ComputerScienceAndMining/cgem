/*
 * Controller for Samples
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SamplesIndexCtrl ($log) {
    $log.debug('SamplesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SamplesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.index', [])
    .controller('SamplesIndexCtrl', SamplesIndexCtrl)
})();
