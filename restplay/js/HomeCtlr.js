define(['js/app.js', 'clipboard.min', 'ace'], function(app, Clipboard) {
	app.register.controller('HomeCtlr', ['$scope','$http','$rootScope', '$routeParams','ngToast', '$sce', '$q', function($scope,$http,$rootScope, $routeParams, ngToast, $sce, $q) {
		$scope.searchText = '';
		$scope.showmodal = {};
		$scope.locale = {};
		$scope.devProfileNotEnabled = true;
		var apiUrl = '',
		restUrl = '',
		redirectedapiPath = $routeParams.path,
		redirectedAppName = '',
		redirectedResource,
		redirectedApi,
		splitPaths,
		apiOrder = {'GET': 1, 'POST': 2, 'PUT': 3, 'PATCH': 4, 'OPTIONS': 5, 'HEAD': 6, 'DELETE': 7},
		locationPath = window.location.pathname,
		urlPrefix = /*'http://see-wv-a188:8500' ||*/ locationPath.substring(0, locationPath.indexOf('/restplay')) || '';
		apiUrl = urlPrefix + '/restapps/';


		

		var dangerError = function(message) {
			message = decodeURIComponent(message);
			ngToast.danger(message);
		};
		var getLocaleValue = function(msg,variables){
    		 if(variables && variables.length > 0){
    		  var index =0;
              for(var i =0;i<variables.length;i++){
                  var v = variables[i];
    			  index = msg.indexOf("{}",index);
    			  msg = msg.substring(0,index) + " " + v + " " + msg.substring(index+3,msg.length);
    		  }
    		}
    		 return msg;
    	};
		var langStr =  (function getLangString() {
			var lang, androidLang, langStr;
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
						langStr = "en";
					}
					else{
						langStr = "ja";
					}
				}
				 //langStr = "_ja";
				return langStr;
		})();
		if (redirectedapiPath) {
			redirectedapiPath = redirectedapiPath.replace('/', '');
			splitPaths = redirectedapiPath.split('/');

			redirectedAppName = splitPaths[0];
			splitPaths.splice(0, 1);
			redirectedResource = splitPaths[0]
			redirectedApi = splitPaths.join('/');
		}


		
		var fullApplicationList = $scope.applications = [];
		$scope.selectedApp = {};
		$scope.api = {		};

		$scope.tryOutModel = {
			// url: $scope.api.url,
			// method: $scope.api.methods[0],
			 
		};

		$scope.tryOutUI = {
			bodyType: 'text',
			headers: [],
			parameters: [],
			apiCollapsed: false,
			appCollapsed: false,
			openSections: {},
			response : {},
			statusMap: {
				200: 'OK',
				201: 'CREATED',
				202: 'ACCEPTED',
				203: 'PARTIAL INFORMATION',
				204: 'NO RESPONSE',
				400: 'BAD REQUEST',
				401: 'Unauthorized',
				402: 'PaymentRequired',
				403: 'Forbidden',
				404: 'Not found',
				500: 'Internal Error',
				501: 'Not Implemented',
				502: 'Service Temporarily overloaded',
				503: 'Gateway timeout',
				301: 'Moved',
				302: 'Found',
				303: 'Method',
				304: 'Not Modified'
			}
		}
		$scope.tabs = {
			'params': {
				active: 'headers'
			},
			'response': {
				active: 'body'
			}
		}

		$scope.setActive = function(tabsName, tabName) {
			$scope.tabs[tabsName].active = tabName;
			if (tabName === 'body') {
				setTimeout(function() {
					var editor = $scope.inputEditor = ace.edit("editor");
					ace.config.set('basePath', '/restplay/js/');
			    	editor.getSession().setMode("ace/mode/json");
			    	editor.focus && editor.focus();
			    	//editor.setTheme("ace/theme/monokai");
			    	$scope.responseEditor && $scope.responseEditor.resize();
				}, 100);
			}
		}

		$scope.isActive = function(tabsName, tabName) {
			return $scope.tabs[tabsName].active === tabName;
		}

		$scope.addHeader = function(type) {
			var listObj = type === 'header' ? $scope.tryOutUI.headers :  $scope.tryOutUI.parameters;
			listObj.push({
				name: '',
				value: '',
				type: type === 'header' ? 'header' :'query'
			})
			setTimeout(function() {
				var listParent = type === 'header' ? '.request-headers' : '.request-parameters';
				var lastHeaderName = document.querySelector && document.querySelector(listParent + ' .header-row:last-child .header-field:first-child');
				if (lastHeaderName) {
					lastHeaderName.focus();
				}
			}, 0);	
		}
		$scope.deleteHeader = function(index, type) {
			var listObj = type === 'header' ? $scope.tryOutUI.headers :  $scope.tryOutUI.parameters;
			listObj.splice(index, 1);
		};

		$scope.showInfo =  function(parameter, val) {
			var param = parameter;
			if (param.paramObj) {
				param.paramObj.show = !param.paramObj.show;
			}
		};

		$scope.toggleListing = function(listType) {
			$scope.tryOutUI.appCollapsed = !$scope.tryOutUI.appCollapsed;
			//$scope.$apply();
			//console.log($scope.tryOutUI.appCollapsed);
			setTimeout(function() {
				var apiEl = document.querySelector('.api-list-c'),
					apiDetailEl = document.querySelector('.api-detail');
					setWidths($scope.tryOutUI.appCollapsed, $scope.tryOutUI.apiCollapsed, apiEl, apiDetailEl);
			}, 0);
		};
		var setWidths = function(sourceFlag, targetFlag, targetEl, apiDetailEl) {
			// var targetWidth, apiDetailWidth;
			// if (sourceFlag && targetFlag) {
			// 	apiDetailWidth = 'calc(100% - 100px)';
			// }
			// else if (sourceFlag || targetFlag){
			// 	if (!targetFlag) {
			// 		targetWidth = '30%';
			// 	}
			// 	apiDetailWidth = 'calc(70% - 50px)';

			// }
			// else {
			// 	targetWidth = '20%';
			// 	apiDetailWidth = '60%';
			// }

			// if (targetWidth) {
			// 	targetEl.style.width = targetWidth;
			// }
			
			// apiDetailEl.style.width = apiDetailWidth;
			if (sourceFlag) {
				apiDetailEl.style.width = 'calc(100% - 50px)';
			}
			else {
				apiDetailEl.style.width = '80%';
			}
			
		};

		// $scope.browseFile = function() {
		// 	var fileInput = document.querySelector('.appname-file-input');
		// 	if (fileInput) {
		// 		fileInput.click();
		// 	}
		// };
		// $scope.fileBrowsed = function(event) {
		// 	console.log(event);
		// }
		$scope.toggleApiListing = function() {
			$scope.tryOutUI.apiCollapsed = !$scope.tryOutUI.apiCollapsed;
			$scope.$apply();
			setTimeout(function() {
				var appEl = document.querySelector('.app-list-c'),
					apiDetailEl = document.querySelector('.api-detail');

				setWidths($scope.tryOutUI.apiCollapsed, $scope.tryOutUI.appCollapsed, appEl, apiDetailEl);
				
				
			}, 0);
		};

		$scope.toggleSection = function(name) {
			$scope.tryOutUI[name] = !$scope.tryOutUI[name];
		};

		$scope.isSectionOpen = function(name) {
			return $scope.tryOutUI[name] === true;
		};

		var createResEditor = function(){
			var editor = $scope.responseEditor = ace.edit("responseEditor");
			editor.getSession().setMode("ace/mode/json");
			//editor.setReadOnly(true);
			editor.setOptions({readOnly: true, highlightActiveLine: false, highlightGutterLine: false});
			editor.renderer.$cursorLayer.element.style.display = "none"
			//disable editor
			// editor.setOptions({
			//     readOnly: true,
			//     highlightActiveLine: false,
			//     highlightGutterLine: false
			// })
			// editor.renderer.$cursorLayer.element.style.opacity=0;
			// editor.textInput.getElement().disabled=true;
			// editor.textInput.getElement().tabIndex=-1
			// editor.commands.commmandKeyBinding={};
		}
		createResEditor();
		$scope.tryOutApi = function() {
			var tryOutModel = $scope.tryOutModel,
				tryOutUI = $scope.tryOutUI,
				headerMap = {}, parameterMap = {},
				matrixParams = [],
				matrixStr = '';
				pathName = '',
				rawUrl = tryOutUI.url;

			tryOutUI.triedOut = true;
			// set post DATA
			if (tryOutModel.method === 'POST' || tryOutModel.method === 'PUT' || tryOutModel.method === 'PATCH') {
				tryOutModel.data = $scope.inputEditor && $scope.inputEditor.getSession().getValue();
			}
			else {
				// to fix angular bug of content type not being set in GET, DELETE
				tryOutModel.data  = '';
			}

			// set Headers
			angular.forEach(tryOutUI.headers, function(header) {
				if (header.name) {
					headerMap[header.name] = header.value;
				} 
				
			});
			if(!headerMap.Accept) {
				headerMap.Accept = undefined;
			}

			tryOutModel.headers = headerMap;

			// set parameters
			angular.forEach(tryOutUI.parameters, function(parameter) {
				if (parameter.name /*&& parameter.value */) {
					if (parameter.type === 'query') {
						parameterMap[parameter.name] = parameter.value;
					}
					if(parameter.type === 'matrix') {
						matrixParams.push(parameters);
					}
					if (parameter.type === 'path') {
						pathName = '{' + parameter.name + '}';
						rawUrl = rawUrl.replace(pathName, parameter.value);
					}
					
				} 

				
			});
			tryOutModel.params = parameterMap;
			if (matrixParams.length) {

				for(var j = 0, jj = matrixParams.length; j < jj; j++){
					matrixStr +=  ';' + matrixParams[i].name + '=' + matrixParams[i].value;
				}
				rawUrl += matrixStr;
			}
			tryOutModel.url = rawUrl;
			$http(tryOutModel).
			success(function(response, status, headers) {


				processResponse(response, status,  headers);

			}).
			error(function(response, status, headers) {
				
				
				processResponse(response, status, headers);
			});
		}

		var processResponse = function(response, status, headers) {
			
			var rawHeaders = headers(),
			editor = $scope.responseEditor,
			parsedHeaders = [];

			// For some weird reason, hasOwnProperty of object is being overriden, hence this code
			for( var key in rawHeaders) {
				parsedHeaders.push([key, rawHeaders[key]])
			}
			$scope.tryOutUI.responseHeaders = parsedHeaders;
			$scope.tryOutUI.ServerError = false;
			$scope.tryOutUI.response.status = status;
			var editorSession = $scope.responseEditor && $scope.responseEditor.getSession();
			var responseContentType = rawHeaders['content-type'] || '';

			try {
				if (rawHeaders['server-error'] ==  "true" || responseContentType.indexOf('html') > -1){

					$scope.tryOutUI.ServerError = true;
					document.getElementById('htmlResponse').innerHTML = response;
				}
				else if (responseContentType.indexOf('json') > -1 ) {
					editor.getSession().setMode("ace/mode/json");
					editorSession.setValue('');
					editorSession.setValue(vkbeautify.json(response, 4));
					$scope.responseEditor.resize();
				}
				else if (responseContentType.indexOf('xml') > -1 ) {
					editor.getSession().setMode("ace/mode/xml");
					editorSession.setValue(vkbeautify.xml(response));
					$scope.responseEditor.resize();
				}
				else {
					editor.getSession().setMode("ace/mode/text");
					editorSession.setValue(response);
					$scope.responseEditor.resize();
					
				}
			}
			catch (error) {
				editor.getSession().setMode("ace/mode/text");
				editorSession.setValue(response);
				$scope.responseEditor.resize();
			}
			
		}
		$scope.hasKeys = function(obj){
			var headers = obj || {};
			var hasHeaders = false;
			for(var key in headers){
				if(headers.hasOwnProperty(key)){
					hasHeaders = true;
					break;
				}
			}
			return hasHeaders;
		}
		var clearState = function () {
			$scope.tryOutUI.headers = [];
			$scope.tryOutUI.parameters = [];
			$scope.tryOutUI.triedOut = false;
			$scope.tryOutUI.selectedOperation = null;
			$scope.inputEditor && $scope.inputEditor.getSession().setValue('');


			$scope.tryOutUI.response = {};
			$scope.tryOutUI.responseHeaders = [];
			if ($scope.responseEditor) {
				$scope.responseEditor.getSession().setValue('');
			}
			$scope.tryOutUI.ServerError = false;
			var htmlReponseEl = document.getElementById('htmlResponse');
			htmlReponseEl && (htmlReponseEl.innerHTML = '');
		};
		var populateParams = function (methodIndex) {
			var parameters = $scope.api.operations[methodIndex].parameters || [],
				param;
			for (var i = 0, ii = parameters.length; i < ii; i++) {
				param = parameters[i];

				if (param.paramType === 'query' || param.paramType==='path' || param.paramType === 'matrix') {
					$scope.tryOutUI.parameters.push({
						name: param.name,
						value: undefined,
						paramObj: param,
						type: param.paramType
					});
				}
				if (param.paramType === 'cookie' || param.paramType==='header' ) {
					$scope.tryOutUI.headers.push({
						name: param.name,
						value: undefined,
						paramObj: param
					});
				}
			}
		};
		$scope.updateVerb = function(operation){
			$scope.selectApi($scope.api, null, operation.method, null, operation);
		};
		$scope.selectApi = function(api, app, method, $event, operation) {
			var selectedApp = $scope.selectedApp,
				description, i, ii;
			method = method || api.operations[0].method;
			$scope.api = api;

			$scope.tryOutUI.url = restUrl + (selectedApp.isdefault ? '' :  '/' + selectedApp.appname) + api.path;
			//REST State
			$scope.tryOutModel = {
				//rawurl: restUrl + (selectedApp.isdefault ? '' :  '/' + selectedApp.appname) + api.path,
				method: method,
				headers: [],
				parameters: [],
				transformResponse: [function (data) {
				      return data;
				 }]

			};
			clearState();

			//Populate new state
			$scope.tryOutUI.methodDescription = '';
			for(i = 0, ii = api.operations.length; i < ii; i++) {
				if (operation && api.operations[i] === operation) {
					$scope.tryOutUI.methodDescription = api.operations[i].summary;
					break;
				}
				else if (!operation) {
					break;
				}
			}
			var selectedOp = $scope.tryOutUI.selectedOperation = api.operations[i];
			if (selectedOp.produces) {
				$scope.tryOutUI.headers.push({
					name: 'Accept',
					value: selectedOp.produces.join(','),
					list: selectedOp.produces,
					listValue: selectedOp.produces.slice()
				})
			}
			if (selectedOp.consumes) {
				$scope.tryOutUI.headers.push({
					name: 'Content-Type',
					value: selectedOp.consumes.join(','),
					list: selectedOp.consumes,
					listValue: selectedOp.consumes.slice()
				})
			}
			populateParams(i);

			$scope.tryOutUI.name = selectedApp.appname + api.path;
			if ($event) {
				$event.stopPropagation();
			}
		};
		$scope.setListing = function(header) {
			header.value = header.listValue.join(',');
			//console.log(header.value);
		}
		// $scope.tryOutModel = {
		// 		url: 'http://localhost:8500/rest/cfapi/users/setuser/',
		// 		method: 'POST'
		// 	};

		var bodyTypeMap = {};

		$scope.selectBodyType = function() {

			var bodyType = $scope.tryOutUI.bodyType;
			$scope.inputEditor.getSession().setMode("ace/mode/" + bodyType);
			$scope.inputEditor.focus && $scope.inputEditor.focus();
		};
		$scope.registerApp = {};
		$scope.showRegisterApp = function(value) {
			$scope.showmodal.showRegister = value;
		};
		$scope.sortResources = function(api) {
			api.operations = api.operations.sort(function(a, b){
				return apiOrder[a.method] > apiOrder[b.method] ? 1 : -1
			});
			return '';
		};
		$scope.focusSearch = function ($event) {
			this.toggleListing();
			var searchEl = document.querySelector('.app-search');
			setTimeout(function() {
				searchEl && searchEl.focus();

			}, 0);
			$event.stopPropagation();
		};
		$scope.focusShowApp = function($event) {
			this.showRegisterApp(true);
			$event.stopPropagation();
		};
		$scope.doRegisterApp = function() {
			var registerApp = $scope.registerApp;
			if (registerApp.appPath) {
				$http.get(apiUrl + 'register/', {
					params: {
						servicedirpath: registerApp.appPath,
						servicemapping: registerApp.mapping,
						isdefault: registerApp.isdefault,
						host: registerApp.wshost
					}
				}).success(function(response) {
					ngToast.create($scope.locale.ServiceRegistered);
					$scope.registerApp = {};
					$scope.showRegisterApp(false);
					fetchApps();
				}).error(function(response, status, headers) {
					if (hasServerError(response, headers)) {
						return;
					}
					dangerError(response.error || $scope.locale.ServiceNotRegistered);
				});
			}
			else {
				dangerError($scope.locale.EnterValidApp);
			}
			
		};

		 var hasServerError = function(response, headers) {
			var rawHeaders = headers();
			if (rawHeaders['server-error'] == "true") {
				$scope.showmodal.modalError =  true;
				//$scope.tryOutUI.modalErrorTitle = 'Error fetching application ' + appName;
				$scope.tryOutUI.modalErrorMsg = $sce.trustAsHtml(response);
				return true;
			}

			return false;

		};
		$scope.showError = function(app) {
			dangerError(app.message);
		}
		var loadApp = $scope.loadApp = function(appName, hardRefresh, myapp) {
			var url = apiUrl+ '?apps=' + appName + '&refresh=true';

			if (hardRefresh) {
				$scope.tryOutUI.refreshInProcess = true;
			}
			var configPromise = $http.get(apiUrl + 'config');
			var loadAppPromise = $http.get(url);

			loadAppPromise.error(function(response, status, headers) {


				$scope.tryOutUI.refreshInProcess = false;

				var headerValues = headers();
				if (headerValues['server-error'] == "true") {
					$scope.showmodal.modalError =  true;
					//$scope.tryOutUI.modalErrorTitle = 'Error fetching application ' + appName;
					$scope.tryOutUI.modalErrorMsg = $sce.trustAsHtml(response);
				}
				else {
					if(myapp) {
						myapp.message = response.error || '';
					}
					dangerError(response.error || $scope.locale.ErrorUpdateApps);
				}
			});

			configPromise.error(function(response) {
				dangerError(response.error || $scope.locale.ErrorFetchConf);
			});

			$q.all([configPromise, loadAppPromise])
			.then(function(responses) {
				//apiUrl =  window.location.origin + '/' +  responses[0].data.resturlpattern;
				var response = responses[1].data;
				//$scope.applications = response;
				$scope.tryOutUI.refreshInProcess = false;
				var app = $scope.selectedApp = response[0],
				resourceToSelect,
				apiToSelect;
				if(myapp) {
					myapp.message = '';
				}
				if (app){
					restUrl = window.location.protocol + '//' + (app.host || window.location.host) + urlPrefix + '/' + responses[0].data.resturlpattern;

					if (!redirectedResource || hardRefresh) {
						for (var key in app.resources) {
							resourceToSelect = app.resources[key];
							break;
						}
						apiToSelect = resourceToSelect.apis[0];
					}
					else {
						resourceToSelect = app.resources[redirectedResource];
						for (var i =0, ii = resourceToSelect.apis.length; i < ii; i++) {
							if (resourceToSelect.apis[i].path === ('/' + redirectedApi) ){
								break;
							}
						}
						apiToSelect = resourceToSelect.apis[i];
					}

					var selectedApiOperations = apiToSelect.operations;

					apiToSelect.operations = apiToSelect.operations.sort(function(a, b) {
						return apiOrder[a.method] > apiOrder[b.method] ? 1 : -1;
					});
					$scope.selectApi(apiToSelect, app);
				}
				
				
			}, function(errors){
				
					
			})
		};

		$scope.deleteApp = function(name) {
			var doDeleteApp = function() {
				$http.get(apiUrl + 'delete', {
					params: {
						applicationmapping: name
					}
				}).success(function() {
					fetchApps();
				}).error(function(response) {
					dangerError(response.error || $scope.locale.CouldNotDelete);
				});
			};
			

			$.confirm({
            title: $scope.locale.DeleteApp,
            text: getLocaleValue($scope.locale.DeleteAppName, [name]),
            confirm: function() {
                doDeleteApp();
            },
            confirmButton: 'Yes',
            cancelButton: 'No',
            confirmButtonClass: 'butn ',
            cancelButtonClass: 'butn  btn-warning'
        });
		};
		var fetchApps = function(){
			$http.get(apiUrl )
			.success(function(response) {
				$scope.devProfileNotEnabled = false;
				
				
				$scope.applications = response;
// 				//$scope.applications = [{name: "multipapp", status: "error", message: "----"}
// , {name: "voidreturn", status: "error", message:"" }];

				loadApp(redirectedAppName || $scope.applications[0].name);
				
			})
			.error(function(response) {
				if (response.statuscode === "401") {
					$scope.noAppMsg = $sce.trustAsHtml($scope.locale.EnableDevProfile);
				}
				else {
					$scope.devProfileNotEnabled = false;
					dangerError(response.error || $scope.locale.ErrorFetchApplications);
				}
				
			});
		};

		$http.get('locale/home_' + langStr + '.json')
		.success(function(res) {
			$scope.locale = res || {};
			$scope.noAppMsg = $scope.locale.NoAppMsg;
			document.title = $scope.locale.PageTitleBar;
			if (redirectedAppName) {
				$scope.applications = [redirectedAppName];
				loadApp(redirectedAppName);
			}
			else {
				fetchApps();
			}
		});
		
		
		// Clipboard setup for copying URL
		$scope.Clipboard = Clipboard;
		var clipboard = new Clipboard('.url-copy-btn-c');

		var toggleTip = function() {
			$scope.$apply(function() {
	    		$scope.tryOutUI.urlCopied = true;
			});
	    	setTimeout(function() {
	    		$scope.$apply(function() {
		    		$scope.tryOutUI.urlCopied = false;
				});
	    	}, 1000);
		}
	    clipboard.on('success', function(e) {
	    	toggleTip();

	        e.clearSelection();
	    });

	    clipboard.on('error', function(e) {
	      	toggleTip();
	    });
		
	}]);
});