;(function () {
  'use strict'

  window.app = angular.module('app', [

    // Addons
    'ngResource',

    // Services
    // Interceptors
    // Filters

    // directives
    'app.directives.filereader',

    // Controllers
    'app.controllers.application',
    'app.controllers.home',
    // 'app.controllers.resource.action'

    // Components
    'app.components.dynamic-creator.controller',
    'app.components.dynamic-creator.component',
    'app.components.dynamic-filler.controller',
    'app.components.dynamic-filler.component',

    // BEGIN: DO NOT DELETE FOLLOWING TAG, DO NOT REMOVE THE INDENTATION
    // <controllers_scaffold>
    'app.controllers.pictures.index',
    'app.controllers.pictures.show',
    'app.controllers.pictures.edit',
    'app.controllers.pictures.new',
    // 'app.controllers.parameters.index',
    // 'app.controllers.parameters.show',
    // 'app.controllers.parameters.edit',
    // 'app.controllers.parameters.new',
    'app.controllers.lab_tests.index',
    'app.controllers.lab_tests.show',
    'app.controllers.lab_tests.edit',
    'app.controllers.lab_tests.new',
    // 'app.controllers.test_statuses.index',
    // 'app.controllers.test_statuses.show',
    // 'app.controllers.test_statuses.edit',
    // 'app.controllers.test_statuses.new',
    // 'app.controllers.test_type_versions.index',
    // 'app.controllers.test_type_versions.show',
    // 'app.controllers.test_type_versions.edit',
    // 'app.controllers.test_type_versions.new',
    'app.controllers.test_types.index',
    'app.controllers.test_types.show',
    'app.controllers.test_types.edit',
    'app.controllers.test_types.new',
    // 'app.controllers.specimen_group_relationships.index',
    // 'app.controllers.specimen_group_relationships.show',
    // 'app.controllers.specimen_group_relationships.edit',
    // 'app.controllers.specimen_group_relationships.new',
    // 'app.controllers.specimen_groups.index',
    // 'app.controllers.specimen_groups.show',
    // 'app.controllers.specimen_groups.edit',
    // 'app.controllers.specimen_groups.new',
    'app.controllers.specimens.index',
    'app.controllers.specimens.show',
    'app.controllers.specimens.edit',
    'app.controllers.specimens.new',
    // 'app.controllers.specimen_type_versions.index',
    // 'app.controllers.specimen_type_versions.show',
    // 'app.controllers.specimen_type_versions.edit',
    // 'app.controllers.specimen_type_versions.new',
    'app.controllers.specimen_types.index',
    'app.controllers.specimen_types.show',
    'app.controllers.specimen_types.edit',
    'app.controllers.specimen_types.new',
    'app.controllers.samples.index',
    'app.controllers.samples.show',
    'app.controllers.samples.edit',
    'app.controllers.samples.new',
    'app.controllers.sample_type_versions.index',
    'app.controllers.sample_type_versions.show',
    'app.controllers.sample_type_versions.edit',
    'app.controllers.sample_type_versions.new',
    'app.controllers.sample_types.index',
    'app.controllers.sample_types.show',
    'app.controllers.sample_types.edit',
    'app.controllers.sample_types.new',
    'app.controllers.work_orders.index',
    'app.controllers.work_orders.show',
    'app.controllers.work_orders.edit',
    'app.controllers.work_orders.new',
    // 'app.controllers.work_order_statuses.index',
    // 'app.controllers.work_order_statuses.show',
    // 'app.controllers.work_order_statuses.edit',
    // 'app.controllers.work_order_statuses.new',
    // 'app.controllers.users.index',
    // 'app.controllers.users.show',
    // 'app.controllers.users.edit',
    // 'app.controllers.users.new',
    // 'app.controllers.organisations.index',
    // 'app.controllers.organisations.show',
    // 'app.controllers.organisations.edit',
    // 'app.controllers.organisations.new',

    // </controllers_scaffold>
    // END: DO NOT DELETE FOLLOWING TAG, DO NOT REMOVE THE INDENTATION
  ])
})();
