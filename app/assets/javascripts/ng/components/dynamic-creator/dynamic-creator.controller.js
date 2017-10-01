;(function() {
  'use strict';

  angular
    .module('app.components.dynamic-creator.controller', [])
    .controller('DynamicCreatorController', DynamicCreatorController);

  DynamicCreatorController.$inject = ['$log','$scope']

  function DynamicCreatorController ($log, $scope) {
    $log.debug('DynamicCreatorController: Hi!')
    var vm = this

    vm.$onInit = function () {
      function initData () {
        vm.data = {
          version: 0,
          fields: [
            {
              type: 'text',
              name: 'Campo 1',
              mandatory: false
            }
          ]
        }
      }

      if (vm.value) {
        vm.data = JSON.parse(vm.value)
        if (!vm.data) initData()
      }
      else {
        initData()
      }
    }

    vm.fieldHasMultiple = {
      'number': false,
      'date': false,
      'text': false,
      'textarea': false,
      'color': false,
      'picture': false,
      'radio': true,
      'checkbox': true,
    }

    vm.addField = function () {
      var num = vm.data.fields.length + 1
      vm.data.fields.push({
        name: 'Campo ' + num,
        type: 'text',
        mandatory: false
      })
    }

    vm.removeField = function (index) {
      vm.data.fields.splice(index, 1);
    }

    vm.moveFieldUp = function (index) {
      if (index > 0) {
        var tmp = vm.data.fields[index - 1]
        vm.data.fields[index - 1] = vm.data.fields[index]
        vm.data.fields[index] = tmp
      }
    }

    vm.moveFieldDown = function (index) {
      if (vm.data.fields.length > 0 && index < (vm.data.fields.length - 1)) {
        var tmp = vm.data.fields[index + 1]
        vm.data.fields[index + 1] = vm.data.fields[index]
        vm.data.fields[index] = tmp
      }
    }

    vm.addAlternative = function (index) {
      if (!vm.data.fields[index].alternatives) {
        vm.data.fields[index].alternatives = []
      }
      var num = vm.data.fields[index].alternatives.length + 1
      vm.data.fields[index].alternatives.push({name: 'Alternativa ' + num})
    }

    vm.removeAlternative = function (fieldIndex, altIndex) {
      vm.data.fields[fieldIndex].alternatives.splice(altIndex, 1)
    }

    vm.toggleCheckbox = toggleCheckbox
    vm.changeRadioButton = changeRadioButton

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
  }
})();
