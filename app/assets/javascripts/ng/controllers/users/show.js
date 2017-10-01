/*
 * Controller for Users
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function UsersShowCtrl ($log) {
    $log.debug('UsersShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  UsersShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.users.show', [])
    .controller('UsersShowCtrl', UsersShowCtrl)
})();
