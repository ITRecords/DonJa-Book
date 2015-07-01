<%-- 
    Document   : guardarLibro
    Created on : Jul 1, 2015, 5:41:15 PM
    Author     : Daniel Fuentes
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.curso.model.Libro"%>
<%
    String isbn = request.getParameter("isbn");
    String titulo = request.getParameter("titulo");
    String categoria = request.getParameter("categoria");
    Libro libro = new Libro();
    libro.setCategoria(categoria);
    libro.setIsbn(isbn);
    libro.setTitulo(titulo);
    libro.modificar();
    response.sendRedirect("MostrarLibros.jsp");
%>

