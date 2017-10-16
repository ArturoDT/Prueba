<?php

define('EMAIL_FOR_REPORTS', '');
define('RECAPTCHA_PRIVATE_KEY', '@privatekey@');
define('FINISH_URI', 'http://');
define('FINISH_ACTION', 'message');
define('FINISH_MESSAGE', 'Thanks for filling out my form!');
define('UPLOAD_ALLOWED_FILE_TYPES', 'doc, docx, xls, csv, txt, rtf, html, zip, jpg, jpeg, png, gif');

define('_DIR_', str_replace('\\', '/', dirname(__FILE__)) . '/');
require_once _DIR_ . '/handler.php';

?>

<?php if (frmd_message()): ?>
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-default-green.css" type="text/css" />
<span class="alert alert-success"><?php echo FINISH_MESSAGE; ?></span>
<?php else: ?>
<!-- Start Formoid form-->
<link rel="stylesheet" href="<?php echo dirname($form_path); ?>/formoid-default-green.css" type="text/css" />
<script type="text/javascript" src="<?php echo dirname($form_path); ?>/jquery.min.js"></script>
<form enctype="multipart/form-data" class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:480px;min-width:150px" method="post"><div class="title"><h2>Resgistro de Alumnos</h2></div>
	<div class="element-input<?php frmd_add_class("input"); ?>"><label class="title">Nombre(s)<span class="required">*</span></label><input class="null" type="text" name="input" required="required"/></div>
	<div class="element-input<?php frmd_add_class("input1"); ?>"><label class="title">Apellidos<span class="required">*</span></label><input class="null" type="text" name="input1" required="required"/></div>
	<div class="element-select<?php frmd_add_class("select"); ?>"><label class="title">Grupos<span class="required">*</span></label><div class="null"><span><select name="select" required="required">

		<option value="101">101</option>
		<option value="102">102</option>
		<option value="103">103</option>
		<option value="201">201</option>
		<option value="202">202</option>
		<option value="203">203</option>
		<option value="301">301</option>
		<option value="302">302</option>
		<option value="303">303</option></select><i></i></span></div></div>
	<div class="element-select<?php frmd_add_class("select1"); ?>"><label class="title">Horarios<span class="required">*</span></label><div class="null"><span><select name="select1" required="required">

		<option value="101">101</option>
		<option value="102">102</option>
		<option value="103">103</option>
		<option value="201">201</option>
		<option value="202">202</option>
		<option value="203">203</option>
		<option value="301">301</option>
		<option value="302">302</option>
		<option value="303">303</option></select><i></i></span></div></div>
	<div class="element-phone<?php frmd_add_class("phone"); ?>"><label class="title">Telefono<span class="required">*</span></label><input class="null" type="tel" pattern="null" maxlength="24" name="phone" required="required" value=""/></div>
	<div class="element-select<?php frmd_add_class("select2"); ?>"><label class="title">Sexo<span class="required">*</span></label><div class="null"><span><select name="select2" required="required">

		<option value="Femenino">Femenino</option>
		<option value="Masculino">Masculino</option></select><i></i></span></div></div>
	<div class="element-select<?php frmd_add_class("select3"); ?>"><label class="title">Semestre<span class="required">*</span></label><div class="null"><span><select name="select3" required="required">

		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option></select><i></i></span></div></div>
	<div class="element-checkbox<?php frmd_add_class("checkbox"); ?>"><label class="title">Carrera<span class="required">*</span></label>		<div class="column column1"><label><input type="checkbox" name="checkbox[]" value="Tecnico en ventas"/ required="required"><span>Tecnico en ventas</span></label><label><input type="checkbox" name="checkbox[]" value="Tecnico en Informatica"/ required="required"><span>Tecnico en Informatica</span></label></div><span class="clearfix"></span>
</div>
	<div class="element-select<?php frmd_add_class("select4"); ?>"><label class="title">Tutotes</label><div class="null"><span><select name="select4" >

		<option value="option 1">option 1</option>
		<option value="option 2">option 2</option>
		<option value="option 3">option 3</option></select><i></i></span></div></div>
	<div class="element-file<?php frmd_add_class("file"); ?>"><label class="title">Foto</label><label class="null" ><div class="button">Examinar</div><input type="file" class="file_input" name="file" /><div class="file_text">No file selected</div></label></div>
<div class="submit"><input type="submit" value="Enviar"/></div></form><script type="text/javascript" src="<?php echo dirname($form_path); ?>/formoid-default-green.js"></script>

<!-- Stop Formoid form-->
<?php endif; ?>

<?php frmd_end_form(); ?>