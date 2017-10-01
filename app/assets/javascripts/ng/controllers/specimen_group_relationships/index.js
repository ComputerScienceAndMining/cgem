/*
 * Controller for SpecimenGroupRelationships
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SpecimenGroupRelationshipsIndexCtrl ($log) {
    $log.debug('SpecimenGroupRelationshipsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenGroupRelationshipsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_group_relationships.index', [])
    .controller('SpecimenGroupRelationshipsIndexCtrl', SpecimenGroupRelationshipsIndexCtrl)
})();
