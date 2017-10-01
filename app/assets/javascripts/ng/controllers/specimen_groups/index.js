/*
 * Controller for SpecimenGroups
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SpecimenGroupsIndexCtrl ($log) {
    $log.debug('SpecimenGroupsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_groups.index', [])
    .controller('SpecimenGroupsIndexCtrl', SpecimenGroupsIndexCtrl)
})();
