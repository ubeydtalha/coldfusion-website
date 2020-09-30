angular.module('angularModal', []).directive('modal', function() {
    return {
        template: '<div class="modal fade {{class}}" id="{{id}}" role="dialog" data-backdrop="static" tabindex="-1">' +
            '<div class="modal-dialog" style="z-index:10000;padding:0px;margin-top:100px;">' +

            '<div class="modal-content">' +
			'<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">{{locale[mtitle]}}</h4></div>' +
            '<div class="modal-body" ng-transclude style="padding:0px"></div>' +
            '</div>' +
            '</div>' +
            '</div>',
        restrict: 'E',
        transclude: true,
        replace: true,
        scope: true,
        link: function postLink(scope, element, attrs) {
            scope.mtitle = attrs.mtitle;
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