define(['js/angular-route.js',
       // '/admin/js/controllers.js',
        'js/route-resolver.js', 'resizable.min', 'modal', 'ngToast',
            'bootstrap', 'angular-sanitize.min', 'vkbeautify', 'jquery.confirm.min',
            'ng-oi-select.min'
    ], function (Clipboard) {
    var phonecatApp = angular.module('cfrest', [
        'ngRoute',
        'routeResolverServices',
        'angularResizable',
        'angularModal',
        'ngToast',
        'ngSanitize',
        'oi.select'
    ]);

    phonecatApp.config(['$routeProvider', '$httpProvider', 'routeResolverProvider', '$controllerProvider', 'ngToastProvider', function($routeProvider, $httpProvider, routeResolverProvider, $controllerProvider, ngToast, $rootScope) {
        routeResolverProvider.routeConfig.setBaseDirectories('', 'js/');
        var routeResolver = routeResolverProvider.route;
        ngToast.configure({
          verticalPosition: 'bottom',
          horizontalPosition: 'right',
          timeout: 5000,
          maxNumber: 1
        });
        var $customRouteProvider = angular.extend({}, $routeProvider, {
            when: function (path, route) {

              route.resolve = route.resolve || {};
                angular.extend(route.resolve,  {
                    
                });
                angular.extend(route.resolve,  routeResolver.resolve(route).resolve);
              $routeProvider.when(path, route);
              return this;
            }
        });

        phonecatApp.register = {
            controller: $controllerProvider.register
        };

        $customRouteProvider.
            when('/home', {
                templateUrl: 'home.html',
                controller: 'HomeCtlr'
            }).
            otherwise({
                redirectTo: '/home'
            });
    }]);

    (function() {
    angular.module('cfrest')
        .directive('restSpinner', ['$http', '$rootScope', function($http,
            $rootScope) {
            return {
                template: '<img src="images/loading.svg" class="cf-spinner"/>',
                replace: true,
                link: function(scope, elm, attrs) {
                    $rootScope.spinnerActive = false;
                    scope.isLoading = function() {
                        return $http.pendingRequests.length >
                            0;
                    };

                    scope.$watch(scope.isLoading, function(
                        loading) {
                        $rootScope.spinnerActive =
                            loading;
                        if (loading) {
                            elm.removeClass('ng-hide');
                        } else {
                            elm.addClass('ng-hide');
                        }
                    });
                }
            };

        }]);
})
.call(this);
    phonecatApp.directive('customOnChange', function() {
  return {
    restrict: 'A',
    link: function (scope, element, attrs) {
      var onChangeHandler = scope.$eval(attrs.customOnChange);
      element.on('change', onChangeHandler);
      element.on('$destroy', function() {
        element.off();
      });

    }
  };
});
    
        
    return phonecatApp;


});

