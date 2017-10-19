;(function() {
  'use strict';

  angular
    .module('app.components.dynamic-filler.controller', [])
    .controller('DynamicFillerController', DynamicFillerController);

  DynamicFillerController.$inject = ['$log','$scope', '$timeout']

  function DynamicFillerController ($log, $scope, $timeout) {
    $log.debug('DynamicFillerController: Hi!')
    var vm = this

    // Variables
    vm.showJSON = false

    // Functions
    vm.toggleCheckbox = toggleCheckbox
    vm.changeRadioButton = changeRadioButton
    vm.addPicture = addPicture
    vm.$onInit = onInit

    function onInit () {
    
    }

    function toggleCheckbox (field, alternative) {
      alternative.selected = !alternative.selected
      field.alternatives.forEach(function (_alternative) {
        if (_alternative.selected === undefined)
          _alternative.selected = false
      })
    }

    function changeRadioButton (field, alternative) {
      field.value = alternative.name
    }

    function addPicture (field) {
      if (!field.pictures)
        field.pictures = []
      var fileId = _generateUUID()
      field.pictures.push({local_id: fileId})

      $timeout(function () {
        document.getElementById(fileId).click()
      }, 50)
    }

    function _generateUUID() {
      var d = new Date().getTime();
      var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
          var r = (d + Math.random()*16)%16 | 0
          d = Math.floor(d/16)
          return (c=='x' ? r : (r&0x3|0x8)).toString(16)
      });
      return uuid
    }

    window.print = function () {
      console.log(vm)
    }
  }
})();
