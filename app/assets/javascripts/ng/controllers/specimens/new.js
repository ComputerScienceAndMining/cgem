/*
 * Controller for Specimens
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimensNewCtrl ($log) {
    $log.debug('SpecimensNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimensNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.new', [])
    .controller('SpecimensNewCtrl', SpecimensNewCtrl)
})();
