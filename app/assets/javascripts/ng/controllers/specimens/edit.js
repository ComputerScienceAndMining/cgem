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
    vm.specimenTypeVersion = JSON.parse(vm.specimenTypeVersion)
    vm.specimenTypeVersions = JSON.parse(vm.specimenTypeVersions)
    vm.specimenTypeVersionId = vm.specimenTypeVersionId || undefined

    var template = vm.specimen.data || vm.specimenTypeVersion.data || vm.dynamicTemplate || undefined
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
      var specimenTypeVersion = _.find(vm.specimenTypeVersions, function (specimenTypeVersion) {
        return specimenTypeVersion.id == vm.specimenTypeVersionId
      })
      vm.dynamicTemplate = specimenTypeVersion.data
    }
  }

  // Inject dependencies
  SpecimensEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.specimens.edit', [])
    .controller('SpecimensEditCtrl', SpecimensEditCtrl)
})();
