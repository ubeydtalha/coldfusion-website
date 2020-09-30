    var APIMDocApp = angular.module('CfRestApp', []);
     
    APIMDocApp.controller('PreviewCtlr', function ($scope,$http,$rootScope,$routeParams) {
	
	
	 $scope.getDoc = function(){
       $http({
            method: "get",
            url: 'apimdoc.json',
			data : $scope.data
              }).success(function (data) {
				$scope.api = data;
				

          }).error(function (data) {
			  
          });
	}


	  $scope.currentpreviewapiclicked = '';

		    $scope.previewapiListingClick = function(o,a,r) {
				    currentapiclicked = o.method;
					currentapiclicked = currentapiclicked + o.consumes;             
					currentapiclicked = currentapiclicked + o.produces;
					currentapiclicked = currentapiclicked + a.path;
                if ($scope.currentpreviewapiclicked == currentapiclicked) {
                     $scope.currentpreviewapiclicked = '';
                } else {
                    $scope.currentpreviewapiclicked = currentapiclicked;
                }
				//a.mappedpath = $scope.getMappedPath(a.path,r);
        
           }

		   
		    $scope.ispreviewapiListingClick = function(o,path) {
				   
                    return $scope.currentpreviewapiclicked == o.method + o.consumes + o.produces + path;
                
           }

		    $scope.showmodal = {};

            $scope.setModel = function(id) {
                $scope.showmodal['' + id] = true;
            }

			$scope.showschema   =false;

			$scope.showschemafunc = function(v) {
                $scope.showschema = v;
            }

			 $scope.getModel = function(resource, type,handleArray) {
				formattype = $scope.getModelType(resource, type);
                if (type == undefined)
                    return $rootScope.getLocaleValue("NO_RETURN_TYPE_ERROR");
				type = type.toLowerCase();
				isarray = false;
				if(type.indexOf('[') > -1){
                   type = type.substring(type.indexOf('[') + 1,type.indexOf(']'));
				   isarray = true;
				}

                if (resource.models != undefined) {
                            for (c = 0; c < resource.models.length; c++) {
                                m = resource.models[c];
                                if (m.name.toLowerCase() == type) {
									if(!$scope.showschema)
                                     r = m.parseexample;
									else
										r = m.schema;
									if(isarray && handleArray){
                                       r = JSON.parse('[' + m.example + ']');
									}
									return r;
                                }
                            }
                        }
                 return "It is primary data type"

            }

            $scope.parseJson = function(json) {
                try {
                    r = JSON.parse(json);
                } catch (err) {
                    r = json;
                }
                return r;
            }

            $scope.getModelType = function(resource, type) {
                if (type == undefined)
                    return 'text';
				isarray = false;
				if(type.indexOf('[') > -1){
                   type = type.substring(type.indexOf('[') + 1,type.indexOf(']'));
				   isarray = true;
				}

				type = type.toLowerCase();
               if (resource.models != undefined) {
                            for (c = 0; c < resource.models.length; c++) {
                                m = resource.models[c];
                                if (m.name.toLowerCase() == type) {
                                    return m.type;
                                }
                            }
                        }
                    
                return 'string';

            }

   

    });

	//modal directive for bootstrap modal
APIMDocApp.directive('modal', function() {
    return {
        template: '<div class="modal fade {{class}}" id="{{id}}" role="dialog" data-backdrop="static" tabindex="-1">' +
            '<div class="modal-dialog" style="z-index:10000;padding:0px;margin-top:100px;">' +
            '<div class="modal-content">' +
			
            '<div class="modal-body" ng-transclude style="padding:0px"></div>' +
            '</div>' +
            '</div>' +
            '</div>',
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: true,
        link: function postLink(scope, element, attrs) {
            scope.title = attrs.title;
            scope.$watch(attrs.visible, function(value) {
                if (value == true)
                    $(element)
                    .modal('show');
                else
                    $(element)
                    .modal('hide');
            });

            $(element)
                .on('shown.bs.modal', function() {
                    scope.$apply(function() {
                        p = scope;
                        while (!p.showmodal) {
                            p = p.$parent;
                        }
                        attr = attrs.id.trim();
                        p.showmodal[attr] = true;
                    });
                });

            $(element)
                .on('hidden.bs.modal', function() {
                    scope.$apply(function() {
                        p = scope;
                        while (!p.showmodal) {
                            p = p.$parent;
                        }
                        attr = attrs.id.trim();
                        p.showmodal[attr] = false;
                    });
                });
        }
    };
});



 