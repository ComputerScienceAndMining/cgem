/*
 * Controller for Specimens
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimensNewCtrl ($log) {
    $log.debug('SpecimensNewCtrl: Hi')
    var vm = this
    angular.extend(vm, rails_data)

    // Variables
    vm.specimen = JSON.parse(vm.specimen)
    vm.specimenTypeVersion = JSON.parse(vm.specimenTypeVersion)
    vm.specimenTypeVersions = JSON.parse(vm.specimenTypeVersions)
    vm.specimenTypeVersionId = vm.specimenTypeVersionId || undefined
    vm.dynamicTemplate = vm.dynamicTemplate || undefined

    // Functions
    vm.updateTemplate = updateTemplate

    function updateTemplate () {
      var specimenTypeVersion = _.find(vm.specimenTypeVersions, function (specimenTypeVersion) {
        return specimenTypeVersion.id == vm.specimenTypeVersionId
      })
      vm.dynamicTemplate = specimenTypeVersion.data
    }
  }

  // Inject dependencies
  SpecimensNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.new', [])
    .controller('SpecimensNewCtrl', SpecimensNewCtrl)
})();
