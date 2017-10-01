/*
 * Controller for Organisations
 * Action: New
 */
;(function () {
  'use strict';

  // Define controller
  function OrganisationsNewCtrl ($log) {
    $log.debug('OrganisationsNewCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  OrganisationsNewCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.organisations.new', [])
    .controller('OrganisationsNewCtrl', OrganisationsNewCtrl)
})();
