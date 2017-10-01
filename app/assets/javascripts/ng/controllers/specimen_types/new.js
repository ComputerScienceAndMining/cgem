/*
 * Controller for SpecimenTypes
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenTypesNewCtrl ($log) {
    $log.debug('SpecimenTypesNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_types.new', [])
    .controller('SpecimenTypesNewCtrl', SpecimenTypesNewCtrl)
})();
