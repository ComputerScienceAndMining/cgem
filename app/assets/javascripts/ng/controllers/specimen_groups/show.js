/*
 * Controller for SpecimenGroups
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenGroupsShowCtrl ($log) {
    $log.debug('SpecimenGroupsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_groups.show', [])
    .controller('SpecimenGroupsShowCtrl', SpecimenGroupsShowCtrl)
})();
