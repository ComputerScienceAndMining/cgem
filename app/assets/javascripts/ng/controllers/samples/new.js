/*
 * Controller for Samples
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function SamplesNewCtrl ($log) {
    $log.debug('SamplesNewCtrl: Hi')
    var vm = this
    angular.extend(vm, rails_data)

    // Variables
    vm.sampleTypes = JSON.parse(vm.sampleTypes)
    vm.sampleTypeId = vm.sampleTypeId || undefined
    vm.dynamicTemplate = vm.dynamicTemplate || undefined

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
  SamplesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.new', [])
    .controller('SamplesNewCtrl', SamplesNewCtrl)
})();
