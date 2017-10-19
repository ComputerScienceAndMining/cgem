/*
 * Controller for Specimens
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SpecimensEditCtrl ($log) {
    $log.debug('SpecimensEditCtrl: Hi')
    var vm = this
    angular.extend(vm, rails_data)

    // Variables
    vm.specimen = JSON.parse(vm.specimen)
    vm.specimenType = JSON.parse(vm.specimenType)
    vm.specimenTypes = JSON.parse(vm.specimenTypes)
    vm.specimenTypeId = vm.specimenTypeId || undefined

    var template = vm.specimen.data || vm.specimenType.data || vm.dynamicTemplate || undefined
    if (template.fields) {
      template.fields.forEach(function (f) {
        if (f.type == "date")
          f.value = new Date(f.value)
        else if (f.type == "number")
          f.value = parseFloat(f.value)
      })
    }
    vm.dynamicTemplate = template

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
  SpecimensEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.edit', [])
    .controller('SpecimensEditCtrl', SpecimensEditCtrl)
})();
