CKEDITOR.editorConfig = function (config) {
  // ... other configuration ... PARA EDITAR:
  // LINK: http://docs.ckeditor.com/#!/guide/dev_toolbar

config.language = 'es';
config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
config.filebrowserImageUploadUrl = "/ckeditor/pictures";
config.filebrowserUploadUrl = "/ckeditor/attachment_files";

//PLUGGINS
config.extraPlugins = 'autogrow';
config.autoGrow_minHeight = 200;
config.autoGrow_maxHeight = 600;
config.autoGrow_bottomSpace = 50;
// config.extraPlugins = 'tableresize'; //Manejar tablas, no funciona autogrow


// Skins o temas
config.skin = 'office2013';
// config.skin = 'moono-dark';

  config.toolbar_Pure = [
    '/', {
      name: 'basicstyles',
      items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
    }, {
      name: 'paragraph',
      items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
    }, {
      name: 'links',
      items: ['Link', 'Unlink','Anchor']
    }, {
      name: 'styles',
      items: ['Styles', 'Format', 'Font', 'FontSize']
    }, '/',{
      name: 'colors',
      items: ['TextColor', 'BGColor']
    }, {
      name: 'insert',
      items: ['Image', 'Table', 'HorizontalRule', 'PageBreak','SpecialChar','Youtube']
    }, {
      name: 'clipboard',
      items: ['Cut', 'Copy', 'Paste', 'PasteText','PasteFromWord', '-', 'Undo', 'Redo', 'Scayt']
    }, {
      name: 'tools',
      items: ['Maximize','Source','VideoDetector','Smiley','Tableresize']
    }


  ];
  config.toolbar = 'Pure';
  return true;


}
