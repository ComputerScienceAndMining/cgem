/*
 * Controller for Specimens
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimensShowCtrl ($log) {
    $log.debug('SpecimensShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimensShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.show', [])
    .controller('SpecimensShowCtrl', SpecimensShowCtrl)
})();
