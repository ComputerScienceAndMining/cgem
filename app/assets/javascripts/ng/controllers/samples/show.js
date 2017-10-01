/*
 * Controller for Samples
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SamplesShowCtrl ($log) {
    $log.debug('SamplesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SamplesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.show', [])
    .controller('SamplesShowCtrl', SamplesShowCtrl)
})();
