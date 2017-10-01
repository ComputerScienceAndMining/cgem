/*
 * Controller for SpecimenGroupRelationships
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenGroupRelationshipsShowCtrl ($log) {
    $log.debug('SpecimenGroupRelationshipsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupRelationshipsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_group_relationships.show', [])
    .controller('SpecimenGroupRelationshipsShowCtrl', SpecimenGroupRelationshipsShowCtrl)
})();
