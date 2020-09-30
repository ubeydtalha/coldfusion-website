// jQuery File Tree Plugin
//
// Version 1.01
//
// Cory S.N. LaViska
// A Beautiful Site (http://abeautifulsite.net/)
// 24 March 2008
//
// Visit http://abeautifulsite.net/notebook.php?article=58 for more information
//
// Usage: $('.fileTreeDemo').fileTree( options, callback )
//
// Options:  root           - root folder to display; default = /
//           script         - location of the serverside AJAX file to use; default = jqueryFileTree.php
//           folderEvent    - event to trigger expand/collapse; default = click
//           expandSpeed    - default = 500 (ms); use -1 for no animation
//           collapseSpeed  - default = 500 (ms); use -1 for no animation
//           expandEasing   - easing function to use on expand (optional)
//           collapseEasing - easing function to use on collapse (optional)
//           multiFolder    - whether or not to limit the browser to one subfolder at a time
//           loadMessage    - Message to display while initial tree loads (can be HTML)
//
// History:
//
// 1.01 - updated to work with foreign characters in directory/file names (12 April 2008)
// 1.00 - released (24 March 2008)
//
// TERMS OF USE
// 
// This plugin is dual-licensed under the GNU General Public License and the MIT License and
// is copyright 2008 A Beautiful Site, LLC. 
//

if(jQuery) (function($){
	
	$.extend($.fn, {
		fileTree: function(o, h) {
			// Defaults
			if( !o ) var o = {};
			if( o.root == undefined ) o.root = 'root';
			if( o.script == undefined ) o.script = 'jqueryFileTree.cfm';
			if( o.folderEvent == undefined ) o.folderEvent = 'click';
			if( o.expandSpeed == undefined ) o.expandSpeed= 500;
			if( o.collapseSpeed == undefined ) o.collapseSpeed= 500;
			if( o.expandEasing == undefined ) o.expandEasing = null;
			if( o.collapseEasing == undefined ) o.collapseEasing = null;
			//if( o.multiFolder == undefined ) 
			o.multiFolder = false;
			if( o.loadMessage == undefined ) o.loadMessage = 'Loading...';
			if( o.expanded == undefined ) o.expanded ='';
			currentnode = "";
			
			$(this).each( function() {
				
			
				currentnode = $(this);
				//currentnode.addClass('nodeclickhighlight');
				hasexpanded = 'false';
				function showTree(c, t) {
					$(c).addClass('wait');
					$(".jqueryFileTree.start").remove();
					$.post(o.script, { dir: unescape(t) }, function(data) {
						$(c).find('.start').html('');
						$(c).removeClass('wait').append(data);
						if( o.root == t ) 
							$(c).find('UL:hidden').show();
						else 
							$(c).find('UL:hidden').slideDown({ duration: o.expandSpeed, easing: o.expandEasing });
						bindTree(c);


	             if (o.expanded != null && hasexpanded == 'false') {
                    $(c).find('.directory.collapsed').each(function (i, f) {
                             if ((o.expanded).match($(f).children().attr('rel'))) {
                                showTree($(f), escape($(f).children().attr('rel').match(/.*\//)));
                                $(f).removeClass('collapsed').addClass('expanded');
								currentnode.removeClass('nodeclickhighlight');
								currentnode =  $(f).children();
								currentnode.addClass('nodeclickhighlight');
								
                              };
                         });
                 }

			 });

			 
		}		
				function folderNav(t,flag)
				{
					var folderlist = (t).find('LI A');
					var len = (t).find('LI A').length;
					var x, brkCondition ;
					if(flag == 1)
					{
						x = 0;
						brkCondition = len -1;
						if( brkCondition == 0 && $(folderlist[0]).hasClass('nodeclickhighlight'))
						{
							$(folderlist[0]).removeClass('nodeclickhighlight');
							$(folderlist[1]).addClass('nodeclickhighlight');
						}
						
					}
					else
					{
						x = len-1;
						brkCondition = 0;
						if( x == 0 && $(folderlist[1]).hasClass('nodeclickhighlight'))
						{
							$(folderlist[1]).removeClass('nodeclickhighlight');
							$(folderlist[0]).addClass('nodeclickhighlight');
						}
					}
					while(x != brkCondition)
					{
						if($(folderlist[x]).hasClass('nodeclickhighlight'))
						{
							$(folderlist[x]).removeClass('nodeclickhighlight');
							$(folderlist[(x+flag)]).addClass('nodeclickhighlight');
							currentnode = $(folderlist[(x+flag)]);
							break;
						}
						x= x+flag;
					}
				}
				function bindTree(t) {
					$(document).bind('keydown', function(e) {
						if(e.keyCode == 40) //downarrowkey
						{
							folderNav($(t),1);				
						}
						if(e.keyCode == 38) //uparrowkey
						{
							folderNav($(t),-1);				
						}
						if(e.keyCode == 37) //leftarrowkey
						{
							hasexpanded = 'true';
							if(currentnode.parent().hasClass('directory'))
							{
								if(currentnode.parent().hasClass('expanded'))
								{
									currentnode.parent().find('UL').slideUp({ duration: o.collapseSpeed, easing: o.collapseEasing });
									currentnode.parent().find('UL').remove();
									currentnode.parent().removeClass('expanded').addClass('collapsed');
								}
								else
								{									
									
									var folderlist = $(t).find('LI A');
									var x = 0;									
									var len = $(t).find('LI A').length;
									while( x < len)
									{
										if( $(folderlist[x]).attr('rel') == currentnode.attr('rel'))
										{		
											break;
										}
										x = x +1;
									}
									x = x-1;
									while(x >= 0)
									{
										if($(folderlist[x]).parent().hasClass('expanded'))
										{
											currentnode.removeClass('nodeclickhighlight');
											$(folderlist[x]).addClass('nodeclickhighlight');
											currentnode = $(folderlist[x]);
											break;
										}
										x= x-1;		
									}
								}	
							}
														
						}
						if(e.keyCode == 39) //rightarrowkey
						{
							hasexpanded = 'true';
							if(currentnode.parent().hasClass('directory'))
							{
								if(currentnode.parent().hasClass('collapsed'))
								{
									if( !o.multiFolder ) {
										currentnode.parent().parent().find('UL').slideUp({ duration: o.collapseSpeed, easing: o.collapseEasing });
										currentnode.parent().parent().find('UL').remove();
										currentnode.parent().parent().find('LI.directory').removeClass('expanded').addClass('collapsed');
									}
									currentnode.parent().find('UL').remove(); // cleanup
									showTree( currentnode.parent(), escape(currentnode.attr('rel').match( /.*\// )) );
									currentnode.parent().removeClass('collapsed').addClass('expanded');
								}
								else
								{
									folderNav($(t),1);
								}
							}
							
						}
						h(currentnode.attr('rel'));	
						e.stopImmediatePropagation(); 
						e.preventDefault();
					});
					$(t).find('LI A').bind(o.folderEvent, function() {
						 hasexpanded = 'true';
						if( $(this).parent().hasClass('directory') ) {
							if( $(this).parent().hasClass('collapsed') ) {
								// Expand
								if( !o.multiFolder ) {
									$(this).parent().parent().find('UL').slideUp({ duration: o.collapseSpeed, easing: o.collapseEasing });
									$(this).parent().parent().find('UL').remove();
									$(this).parent().parent().find('LI.directory').removeClass('expanded').addClass('collapsed');
								}
								$(this).parent().find('UL').remove(); // cleanup
								showTree( $(this).parent(), escape($(this).attr('rel').match( /.*\// )) );
								$(this).parent().removeClass('collapsed').addClass('expanded');
								
							} else {
								// Collapse
								$(this).parent().find('UL').slideUp({ duration: o.collapseSpeed, easing: o.collapseEasing });
								$(this).parent().find('UL').remove();
								$(this).parent().removeClass('expanded').addClass('collapsed');
							}
							
						} else {
							h($(this).attr('rel'));
						}
						if( $(this).attr('rel') != currentnode.attr('rel'))
						{
						     $(this).addClass('nodeclickhighlight');
							 currentnode.removeClass('nodeclickhighlight');
							 currentnode =$(this) ;
						}
						h($(this).attr('rel'));     
						return false;
					});
					// Prevent A from triggering the # on non-click events
					if( o.folderEvent.toLowerCase != 'click' ) $(t).find('LI A').bind('click', function() { return false; });
				}
				// Loading message
				$(this).html('<ul class="jqueryFileTree start"><li class="wait">' + o.loadMessage + '<li></ul>');
				// Get the initial file list
				showTree( $(this), escape(o.root) );
			});
		}
	});
	
})(jQuery);