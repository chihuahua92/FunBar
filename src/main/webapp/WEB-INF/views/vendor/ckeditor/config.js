/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	//config.filebrowserBrowseUrl = '../js/ckfinder/ckfinder.html'; 
	//config.filebrowserImageBrowseUrl = '../js/ckfinder/ckfinder.html?Type=Images'; 
	//config.filebrowserFlashBrowseUrl = '../js/ckfinder/ckfinder.html?Type=Flash'; 
	//config.filebrowserUploadUrl = '../js/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files'; //可上傳一般檔案 
	//config.filebrowserImageUploadUrl = '../js/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images';//可上傳圖檔 
	//config.filebrowserFlashUploadUrl = '../js/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash';//可上傳Flash檔案
	config.toolbar = [[ 'Maximize','Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord','Undo', 'Redo'],'/',
					  ['Bold','Italic','Underline','Strike','JustifyLeft','JustifyCenter','JustifyRight'],
					  ['Image','Table','HorizontalRule','SpecialChar','Youtube','Preview'],
					  ['TextColor','BGColor','RemoveFormat','Font','FontSize','Source']];
	config.font_names = 'Arial;Arial Black;Comic Sans MS;Courier New;Tahoma;Times　New Roman;Verdana;新細明體;細明體;標楷體;微軟正黑體';
	config.enterMode = CKEDITOR.ENTER_BR;
	
	config.extraPlugins = 'youtube';
	config.youtube_related = true;
	config.youtube_responsive = true;
	config.youtube_older = false;
	config.youtube_privacy = false;
	config.youtube_autoplay = false;
	config.youtube_controls = true;
};
