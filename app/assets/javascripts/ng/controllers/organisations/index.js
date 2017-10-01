/*
 * Controller for Organisations
 * Action: Index
 */
;(function () {
  "use strict";

  // Define controller
  function OrganisationsIndexCtrl ($log) {
    $log.debug('OrganisationsIndexCtrl: Hi')
    var vm = this
    vm.data = angular.extend({}, rails_data || {})
  }

  // Inject dependencies
  OrganisationsIndexCtrl.$inject = ['$log']

  // Register controller
  angular
    .module('app.controllers.organisations.index', [])
    .controller('OrganisationsIndexCtrl', OrganisationsIndexCtrl)
})();
