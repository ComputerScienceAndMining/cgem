/*
 * Controller for SpecimenGroups
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenGroupsEditCtrl ($log) {
    $log.debug('SpecimenGroupsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_groups.edit', [])
    .controller('SpecimenGroupsEditCtrl', SpecimenGroupsEditCtrl)
})();
