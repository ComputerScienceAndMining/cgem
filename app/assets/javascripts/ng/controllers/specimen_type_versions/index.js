/*
 * Controller for SpecimenTypeVersions
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function SpecimenTypeVersionsIndexCtrl ($log) {
    $log.debug('SpecimenTypeVersionsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  SpecimenTypeVersionsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimen_type_versions.index', [])
    .controller('SpecimenTypeVersionsIndexCtrl', SpecimenTypeVersionsIndexCtrl)
})();
