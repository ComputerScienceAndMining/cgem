/*
 * Controller for SpecimenGroups
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenGroupsNewCtrl ($log) {
    $log.debug('SpecimenGroupsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_groups.new', [])
    .controller('SpecimenGroupsNewCtrl', SpecimenGroupsNewCtrl)
})();
