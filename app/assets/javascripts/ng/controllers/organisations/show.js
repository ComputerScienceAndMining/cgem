/*
 * Controller for Organisations
 * Action: Show
 */
;(function () {
  'use strict';

  // Define controller
  function OrganisationsShowCtrl ($log) {
    $log.debug('OrganisationsShowCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  OrganisationsShowCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.organisations.show', [])
    .controller('OrganisationsShowCtrl', OrganisationsShowCtrl)
})();
