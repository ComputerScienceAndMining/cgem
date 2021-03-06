/*
 * Controller for LabTests
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function LabTestsEditCtrl ($log) {
    $log.debug('LabTestsEditCtrl: Hi')
    var vm = this
    angular.extend(vm, rails_data)

    // Variables
    vm.test = JSON.parse(vm.test)
    vm.testTypeVersion = JSON.parse(vm.testTypeVersion)
    vm.testTypeVersions = JSON.parse(vm.testTypeVersions)
    vm.testTypeVersionId = vm.testTypeVersionId || undefined

    var template = vm.test.data || vm.testTypeVersion.data || vm.dynamicTemplate || undefined
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
      var testTypeVersion = _.find(vm.testTypeVersions, function (testTypeVersion) {
        return testTypeVersion.id == vm.testTypeVersionId
      })
      vm.dynamicTemplate = testTypeVersion.data
    }
  }

  // Inject dependencies
  LabTestsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.edit', [])
    .controller('LabTestsEditCtrl', LabTestsEditCtrl)
})();
