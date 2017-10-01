/*
 * Controller for SpecimenTypes
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenTypesEditCtrl ($log) {
    $log.debug('SpecimenTypesEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_types.edit', [])
    .controller('SpecimenTypesEditCtrl', SpecimenTypesEditCtrl)
})();
