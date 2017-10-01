/*
 * Controller for SpecimenGroupRelationships
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenGroupRelationshipsEditCtrl ($log) {
    $log.debug('SpecimenGroupRelationshipsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupRelationshipsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_group_relationships.edit', [])
    .controller('SpecimenGroupRelationshipsEditCtrl', SpecimenGroupRelationshipsEditCtrl)
})();
