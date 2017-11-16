/*
 * Controller for Samples
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function SamplesEditCtrl ($log) {
    $log.debug('SamplesEditCtrl: Hi')
    var vm = this
    angular.extend(vm, rails_data)

    // Variables
    vm.sample = JSON.parse(vm.sample)
    vm.sampleTypeVersion = JSON.parse(vm.sampleTypeVersion)
    vm.sampleTypeVersions = JSON.parse(vm.sampleTypeVersions)
    vm.sampleTypeVersionId = vm.sampleTypeVersionId || undefined

    var template = vm.sample.data || vm.sampleTypeVersion.data || vm.dynamicTemplate || undefined
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
      var sampleTypeVersion = _.find(vm.sampleTypeVersions, function (sampleTypeVersion) {
        return sampleTypeVersion.id == vm.sampleTypeVersionId
      })
      vm.dynamicTemplate = sampleTypeVersion.data
    }
  }

  // Inject dependencies
  SamplesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.edit', [])
    .controller('SamplesEditCtrl', SamplesEditCtrl)
})();
