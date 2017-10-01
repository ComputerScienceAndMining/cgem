/*
 * Controller for Organisations
 * Action: Edit
 */
;(function () {
  'use strict';

  // Define controller
  function OrganisationsEditCtrl ($log) {
    $log.debug('OrganisationsEditCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  OrganisationsEditCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.organisations.edit', [])
    .controller('OrganisationsEditCtrl', OrganisationsEditCtrl)
})();
