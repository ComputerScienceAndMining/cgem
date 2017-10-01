/*
 * Controller for Users
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function UsersNewCtrl ($log) {
    $log.debug('UsersNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  UsersNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.users.new', [])
    .controller('UsersNewCtrl', UsersNewCtrl)
})();
