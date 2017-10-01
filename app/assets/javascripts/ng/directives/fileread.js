;(function() {

  // Define directive
  function FileReadDirective () {
    return {
      scope: {
          fileread: "="
      },
      link: function (scope, element, attributes) {
        element.bind("change", function (changeEvent) {
          var reader = new FileReader();
          reader.onload = function (loadEvent) {
            scope.$apply(function () {
              scope.fileread = loadEvent.target.result;
            });
          }
          reader.readAsDataURL(changeEvent.target.files[0]);
        });
      }
    }
  }

  // Inject dependencies
  // FileReadDirective.$inject = []

  // Register directive
  angular
    .module('app.directives.filereader', [])
    .directive('fileread', FileReadDirective)
})();
