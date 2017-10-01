/*
 * Controller for Users
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function UsersIndexCtrl ($log) {
    $log.debug('UsersIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  UsersIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.users.index', [])
    .controller('UsersIndexCtrl', UsersIndexCtrl)
})();
