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
    vm.sampleType = JSON.parse(vm.sampleType)
    vm.sampleTypes = JSON.parse(vm.sampleTypes)
    vm.sampleTypeId = vm.sampleTypeId || undefined

    var template = vm.sample.data || vm.sampleType.data || vm.dynamicTemplate || undefined
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
      var sampleType = _.find(vm.sampleTypes, function (sampleType) {
        return sampleType.id == vm.sampleTypeId
      })
      vm.dynamicTemplate = sampleType.data
    }
  }

  // Inject dependencies
  SamplesEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.edit', [])
    .controller('SamplesEditCtrl', SamplesEditCtrl)
})();
