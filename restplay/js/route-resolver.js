define([], function () {

    var routeResolver = function () {

        this.$get = function () {
            return this;
        };

        this.langStr = function () {
            var lang, androidLang;
            if (window.navigator && window.navigator.userAgent && (androidLang = window.navigator.userAgent.match(/android.*\W(\w\w)-(\w\w)\W/i))) {
                lang = androidLang[1];
            } else {
                // works for iOS, Android 4.x and other devices
                lang = window.navigator.userLanguage || window.navigator.language;
            }
            // set language
            langStr = "";
            if(lang && lang.length > 1){
                var langStrArr = lang.split('-');
                if(langStrArr[0] != "ja"){
                    langStr = "";
                }
                else{
                    langStr = "_ja";
                }
            }
             //langStr = "_ja";
            return langStr;
        }(),

        this.routeConfig = function () {
            var viewsDirectory = '/',
                controllersDirectory = '/admin/js/controllers/',
                context = 'admin'

            setBaseDirectories = function (viewsDir, controllersDir) {
                viewsDirectory = viewsDir;
                controllersDirectory = controllersDir;
            },

            getViewsDirectory = function () {
                return viewsDirectory;
            },

            getControllersDirectory = function () {
                return controllersDirectory;
            },

            setContext = function (ctxt) {
                context = ctxt;
            },
            getContext = function () {
                return context ;
            };



            return {
                setBaseDirectories: setBaseDirectories,
                getControllersDirectory: getControllersDirectory,
                getViewsDirectory: getViewsDirectory,
                setContext: setContext,
                getContext: getContext
            };
        }();

        this.route = function (routeConfig) {

            var resolve = function (pathsObject, path, secure) {
                if (!path) path = '';

                var routeDef = {};
                routeDef.templateUrl = pathsObject.templateUrl;
                routeDef.controller = pathsObject.controller + '.js';
                routeDef.secure = (secure) ? secure : false;
                routeDef.resolve = {};
                // if(routeDef.templateUrl && routeDef.templateUrl.indexOf('login') === -1) {
                //      routeDef.resolve = {
                //         loginstatus: ['$http', function ($http) {
                //             var loginPromise = $http.get('/amp/'+ routeConfig.getContext() +'/loginstatus', {
                //                 withCredentials: true
                //             });

                           
                //             return loginPromise;
                //         }]
                //     };
                // }
               
                if(pathsObject.controller) {
                    routeDef.resolve.load = ['$q', '$rootScope', function ($q, $rootScope) {
                        var dependencies;
                        if (pathsObject.assetRoot){
                            //absolute paths
                            dependencies = [ pathsObject.assetRoot + 'js/common/' + pathsObject.controller + '.js'];
                            
                        }
                        else {
                            // relative paths
                            dependencies = [routeConfig.getControllersDirectory() + path  + pathsObject.controller + '.js'];
                        }
                        
                        return resolveDependencies($q, $rootScope, dependencies);
                    }];
                }

                if (pathsObject.locale) {
                    routeDef.resolve.locale = ['$http', function ($http) {
                        return $http({
                            method: "get",
                            url: (pathsObject.assetRoot || '') + "locale/" + pathsObject.locale + langStr + ".json"
                        });
                    }];
                }

                return routeDef;
            },

            resolveDependencies = function ($q, $rootScope, dependencies) {
                var defer = $q.defer();
                require(dependencies, function () {
                    defer.resolve();
                    $rootScope.$apply()
                });

                return defer.promise;
            };

            return {
                resolve: resolve
            }
        }(this.routeConfig);

    };

    var servicesApp = angular.module('routeResolverServices', []);

    //Must be a provider since it will be injected into module.config()    
    servicesApp.provider('routeResolver', routeResolver);
});


