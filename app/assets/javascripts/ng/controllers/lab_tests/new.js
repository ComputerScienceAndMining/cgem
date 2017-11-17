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
    vm.testTypeVersion = JSON.parse(vm.testTypeVersion)
    vm.testTypeVersions = JSON.parse(vm.testTypeVersions)
    vm.testTypeVersionId = vm.testTypeVersionId || undefined
    vm.dynamicTemplate = vm.dynamicTemplate || undefined

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
  LabTestsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.lab_tests.new', [])
    .controller('LabTestsNewCtrl', LabTestsNewCtrl)
})();
