/*
 * Controller for Users
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function UsersEditCtrl ($log) {
    $log.debug('UsersEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  UsersEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.users.edit', [])
    .controller('UsersEditCtrl', UsersEditCtrl)
})();
