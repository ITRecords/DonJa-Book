<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="com.curso.model.Libro"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
    <head>
        <title>Mostrar Libros</title>
        <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    </head>
    <body>
        <form id="miformulario">
            <select id="categoria">
                <option value="n/a">Seleccione</option>
                <%
                    List<String> categorias = Libro.listarCategorias();
                    for (String categoria : categorias) {
                %>
                <option value="<%=categoria%>"><%=categoria%></option>
                <% 	} %>
            </select>
        </form>
        <%
            List<Libro> libros = Libro.listar();
            for (Libro libro : libros) {
        %>
        <%=libro.getIsbn()%>
        <%=libro.getTitulo()%>
        <%=libro.getCategoria()%>
        <a href="BorrarLibro.jsp?isbn=<%=libro.getIsbn()%>">Borrar</a>
        <a href="EditarLibro.jsp?isbn=<%=libro.getIsbn()%>">Editar</a>
        <br/>
        <%
            }
        %>
        <a href="FormularioLibro.jsp">Insertar Libro</a>
    </body>
</html>
