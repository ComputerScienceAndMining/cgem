/*
 * Controller for LabTests
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function LabTestsNewCtrl ($log) {
    $log.debug('LabTestsNewCtrl: Hi')
    var vm = this
    angular.extend(vm, rails_data)

    // Variables
    vm.test = JSON.parse(vm.test)
    vm.testType = JSON.parse(vm.testType)
    vm.testTypes = JSON.parse(vm.testTypes)
    vm.testTypeId = vm.testTypeId || undefined
    vm.dynamicTemplate = vm.dynamicTemplate || undefined

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
  LabTestsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.new', [])
    .controller('LabTestsNewCtrl', LabTestsNewCtrl)
})();
