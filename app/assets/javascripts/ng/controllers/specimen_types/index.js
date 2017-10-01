/*
 * Controller for SpecimenTypes
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SpecimenTypesIndexCtrl ($log) {
    $log.debug('SpecimenTypesIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypesIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_types.index', [])
    .controller('SpecimenTypesIndexCtrl', SpecimenTypesIndexCtrl)
})();
