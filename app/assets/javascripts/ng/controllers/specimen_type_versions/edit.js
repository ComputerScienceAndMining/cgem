/*
 * Controller for SpecimenTypeVersions
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenTypeVersionsEditCtrl ($log) {
    $log.debug('SpecimenTypeVersionsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypeVersionsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_type_versions.edit', [])
    .controller('SpecimenTypeVersionsEditCtrl', SpecimenTypeVersionsEditCtrl)
})();
