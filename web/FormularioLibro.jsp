<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<head>
	<title>Formulario Libro</title>
	
	<style type="text/css">
		font-weigth:bold
	</style>
	
	<script type="text/javascript">
		function validacion() {
			var isbn = document.getElementById("isbn");
			var miformulario = document.getElementById("miformulario");
			if (isbn.value == "") {
				alert("datos no validos");
				return false;
			} else
				miformulario.submit();
		}
	</script>
</head>
<body>
	<form id="miformulario" action="insertarLibro.jsp">
		<fieldset>
                <legend>Formulario alta libro</legend>
		<p><label for="isbn">ISBN:</label> <input type="text" id="isbn" name="isbn"/></p>
		<p><label for="titulo">Titulo:</label> <input type="text" id="titulo" name="titulo"/></p>
		<p><label for="categoria">Categoria:</label> <input type="text" id="categoria" name="categoria"/></p>
		<p><input type="button" value="Insertar" onclick="return validacion();"/></p>
		</fieldset>
	</form>
</body>
</html>
