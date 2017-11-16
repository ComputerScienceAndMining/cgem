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
    vm.sampleTypeVersions = JSON.parse(vm.sampleTypeVersions)
    vm.sampleTypeVersionId = vm.sampleTypeVersionId || undefined
    vm.dynamicTemplate = vm.dynamicTemplate || undefined

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
  SamplesNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.samples.new', [])
    .controller('SamplesNewCtrl', SamplesNewCtrl)
})();
