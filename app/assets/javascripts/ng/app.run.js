;(function () {
  'use strict'

  angular.module('app')
  .run(['$rootScope', function($rootScope){
    $rootScope.lang = {
      dynamic: {
        type : I18n.t('type', {scope: "js.dynamic"}),
        field : I18n.t('field', {scope: "js.dynamic"}),
        fields : I18n.t('fields', {scope: "js.dynamic"}),
        edit_fields : I18n.t('edit_fields', {scope: "js.dynamic"}),
        alternatives : I18n.t('alternatives', {scope: "js.dynamic"}),
        add_alternative : I18n.t('add_alternative', {scope: "js.dynamic"}),
        add_field : I18n.t('add_field', {scope: "js.dynamic"}),
        previsualization : I18n.t('previsualization', {scope: "js.dynamic"}),
        data : I18n.t('data', {scope: "js.dynamic"}),
        delete : I18n.t('delete', {scope: "js.dynamic"}),
        new_picture : I18n.t('new_picture', {scope: "js.dynamic"}),
        data_types: {
          number: I18n.t('number', {scope: "js.dynamic.data_types"}),
          text: I18n.t('text', {scope: "js.dynamic.data_types"}),
          long_text: I18n.t('long_text', {scope: "js.dynamic.data_types"}),
          date: I18n.t('date', {scope: "js.dynamic.data_types"}),
          pictures: I18n.t('pictures', {scope: "js.dynamic.data_types"}),
          unique_selection: I18n.t('unique_selection', {scope: "js.dynamic.data_types"}),
          multiple_selection: I18n.t('multiple_selection', {scope: "js.dynamic.data_types"}),
        }
      }
    }
  }])
})();
  