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
    vm.specimenType = JSON.parse(vm.specimenType)
    vm.specimenTypes = JSON.parse(vm.specimenTypes)
    vm.specimenTypeId = vm.specimenTypeId || undefined
    vm.dynamicTemplate = vm.dynamicTemplate || undefined

    // Functions
    vm.updateTemplate = updateTemplate

    function updateTemplate () {
      var specimenType = _.find(vm.specimenTypes, function (specimenType) {
        return specimenType.id == vm.specimenTypeId
      })
      vm.dynamicTemplate = specimenType.data
    }
  }

  // Inject dependencies
  SpecimensNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.new', [])
    .controller('SpecimensNewCtrl', SpecimensNewCtrl)
})();
