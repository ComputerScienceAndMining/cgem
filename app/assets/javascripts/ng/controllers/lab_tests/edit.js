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
    vm.testType = JSON.parse(vm.testType)
    vm.testTypes = JSON.parse(vm.testTypes)
    vm.testTypeId = vm.testTypeId || undefined

    var template = vm.test.data || vm.testType.data || vm.dynamicTemplate || undefined
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
      var testType = _.find(vm.testTypes, function (testType) {
        return testType.id == vm.testTypeId
      })
      vm.dynamicTemplate = testType.data
    }
  }

  // Inject dependencies
  LabTestsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.edit', [])
    .controller('LabTestsEditCtrl', LabTestsEditCtrl)
})();
