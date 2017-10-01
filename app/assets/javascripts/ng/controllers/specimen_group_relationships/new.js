/*
 * Controller for SpecimenGroupRelationships
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimenGroupRelationshipsNewCtrl ($log) {
    $log.debug('SpecimenGroupRelationshipsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupRelationshipsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_group_relationships.new', [])
    .controller('SpecimenGroupRelationshipsNewCtrl', SpecimenGroupRelationshipsNewCtrl)
})();
