/*
 * Controller for Pictures
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function PicturesShowCtrl ($log) {
    $log.debug('PicturesShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  PicturesShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.pictures.show', [])
    .controller('PicturesShowCtrl', PicturesShowCtrl)
})();
