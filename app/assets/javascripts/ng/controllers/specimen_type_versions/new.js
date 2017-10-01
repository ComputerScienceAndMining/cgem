/*
 * Controller for SpecimenTypeVersions
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenTypeVersionsNewCtrl ($log) {
    $log.debug('SpecimenTypeVersionsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypeVersionsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_type_versions.new', [])
    .controller('SpecimenTypeVersionsNewCtrl', SpecimenTypeVersionsNewCtrl)
})();
