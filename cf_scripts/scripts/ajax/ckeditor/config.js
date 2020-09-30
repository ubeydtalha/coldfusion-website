/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// http://docs.ckeditor.com/#!/api/CKEDITOR.config

	config.baseHref = '';
	config.docType = '';
	
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align',  'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];
	
	config.toolbar_Default = [
			{ name: 'document',    items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
			{ name: 'clipboard',   items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
			{ name: 'editing',     items : [ 'Find','Replace','-','SelectAll' ] },
			{ name: 'forms',       items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
			{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
			{ name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
			{ name: 'links',       items : [ 'Link','Unlink','Anchor' ] },
			{ name: 'insert',      items : [ 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak', 'filemanager'] },
			{ name: 'styles',      items : [ 'Styles','Format','Font','FontSize' ] },
			{ name: 'colors',      items : [ 'TextColor','BGColor' ] },
			{ name: 'tools',       items : [ 'Maximize', 'ShowBlocks','-','About' ] }
		];
	
	config.toolbar_Basic = [
			{ name: 'clipboard', 	items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
			{ name: 'links',		items: [ 'Link','Unlink','Anchor','filemanager' ]},
			{ name: 'insert',		items: [ 'Image','Table','HorizontalRule','SpecialChar' ]},
			{ name: 'document', 	items: ['Source']},
			{ name: 'basicstyles',	items: [ 'Bold','Italic','Underline','-','RemoveFormat' ]},
			{ name: 'paragraph',	items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ]},
			{ name: 'styles',		items: [ 'Styles','Format' ]},
			{ name: 'tools',		items: [ 'Maximize','About' ]}
		];
	
	//enable reisizing
	config.resize_enabled = true;
	
	//resize direction: both
	config.resize_dir = 'both';
		
	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	
	//do not return full HTML on getData()
	config.fullPage = false;
	
	//toolbar will be collapseable and expanded on startup, unless ToolbarOnFocus is set to true
	config.toolbarCanCollapse = true;
	config.toolbarStartupExpanded = true;
	
	//toolbar location should be on top.
	config.toolbarLocation = 'top';
	
	//default language is English.
	config.defaultLanguage = 'en';
	
	//default skin
	config.skin = 'moono';
	
	//start-up focus
	config.startupFocus = false;
	
	config.emailProtection = 'mt(NAME,DOMAIN,SUBJECT,BODY)';
	
	//default height & width
	config.height = 300;
	config.width = 900;
	
	config.forcePasteAsPlainText = false;
	
	config.enterMode = CKEDITOR.ENTER_P;
	config.shiftEnterMode = CKEDITOR.ENTER_BR;
	
	config.keystrokes = [
		[ CKEDITOR.CTRL + 65 /*A*/, true ],
		[ CKEDITOR.CTRL + 67 /*C*/, true ],
		[ CKEDITOR.CTRL + 70 /*F*/, true ],
		[ CKEDITOR.CTRL + 83 /*S*/, true ],
		[ CKEDITOR.CTRL + 84 /*T*/, true ],
		[ CKEDITOR.CTRL + 88 /*X*/, true ],
		[ CKEDITOR.CTRL + 45 /*INS*/, true ],
		[ CKEDITOR.CTRL + 88 /*X*/, 'cut' ],
		[ CKEDITOR.SHIFT + 46 /*DEL*/, 'cut' ],
		[ CKEDITOR.CTRL + 90 /*Z*/, 'undo' ],
		[ CKEDITOR.CTRL + 89 /*Y*/, 'redo' ],
		[ CKEDITOR.CTRL + CKEDITOR.SHIFT + 90 /*Z*/, 'redo' ],
		[ CKEDITOR.CTRL + 76 /*L*/, 'link' ],
		[ CKEDITOR.CTRL + 66 /*B*/, 'bold' ],
		[ CKEDITOR.CTRL + 73 /*I*/, 'italic' ],
		[ CKEDITOR.CTRL + 85 /*U*/, 'underline' ],
		[ CKEDITOR.CTRL + CKEDITOR.SHIFT + 83 /*S*/, 'save' ],
		[ CKEDITOR.CTRL + CKEDITOR.ALT + 13 /*ENTER*/, 'fitWindow' ],
		[ CKEDITOR.SHIFT + 32 /*SPACE*/, 'nbsp' ]
	];
	
	config.image_previewText = 'Please enter a URL to preview the image here. To upload an image from your computer, please use the file manager.';
	
	config.menu_groups = 'link,anchor,image,flash,select,textarea,checkbox,radio,textfield,hiddenfield,imagebutton,button,table,form,div';
	config.browserContextMenuOnCtrl = false;
	
	config.colorButton_enableMore = true;
	config.colorButton_colors = '000000,993300,333300,003300,003366,000080,333399,333333,800000,FF6600,808000,808080,008080,0000FF,666699,808080,FF0000,FF9900,99CC00,339966,33CCCC,3366FF,800080,999999,FF00FF,FFCC00,FFFF00,00FF00,00FFFF,00CCFF,993366,C0C0C0,FF99CC,FFCC99,FFFF99,CCFFCC,CCFFFF,99CCFF,CC99FF,FFFFFF';
	
	config.format_tags = 'p;h1;h2;h3;h4;h5;h6;pre;address;div';
	config.font_names = 'Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana';
	config.fontSize_sizes = 'smaller;larger;xx-small;x-small;small;medium;large;x-large;xx-large';
	
	config.undoStackSize = 15;
	
	config.disableObjectResizing = false;
	config.disableNativeTableHandles = true;
	
	config.bodyId = '';
	config.bodyClass = '';
	
	config.removeFormatTags = 'b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var' ;
	config.removeFormatAttributes = 'class,style,lang,width,height,align,hspace,valign';
	
	config.extraPlugins = 'filemanager,justify,indent,indentblock,indentlist';
	
	config.smiley_path = CKEDITOR.basePath + 'plugins/smiley/images/';
	config.smiley_columns = 8;
	config.smiley_images = [
		'regular_smile.png','sad_smile.png','wink_smile.png','teeth_smile.png','confused_smile.png','tongue_smile.png',
		'embarrassed_smile.png','omg_smile.png','whatchutalkingabout_smile.png','angry_smile.png','angel_smile.png','shades_smile.png',
		'devil_smile.png','cry_smile.png','lightbulb.png','thumbs_down.png','thumbs_up.png','heart.png',
		'broken_heart.png','kiss.png','envelope.png'
	];
	config.smiley_descriptions = [
		'smiley', 'sad', 'wink', 'laugh', 'frown', 'cheeky', 'blush', 'surprise',
		'indecision', 'angry', 'angel', 'cool', 'devil', 'crying', 'enlightened', 'no',
		'yes', 'heart', 'broken heart', 'kiss', 'mail'
	];
	 
};
