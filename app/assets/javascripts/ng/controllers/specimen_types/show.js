/*
 * Controller for SpecimenTypes
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenTypesShowCtrl ($log) {
    $log.debug('SpecimenTypesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_types.show', [])
    .controller('SpecimenTypesShowCtrl', SpecimenTypesShowCtrl)
})();
