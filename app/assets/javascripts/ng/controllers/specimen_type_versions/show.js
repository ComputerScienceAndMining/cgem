/*
 * Controller for SpecimenTypeVersions
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenTypeVersionsShowCtrl ($log) {
    $log.debug('SpecimenTypeVersionsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypeVersionsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_type_versions.show', [])
    .controller('SpecimenTypeVersionsShowCtrl', SpecimenTypeVersionsShowCtrl)
})();
