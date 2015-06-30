<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.curso.model.Libro"%>
<%
	String isbn = request.getParameter("isbn");
        Libro libro = new Libro();
        libro.setIsbn(isbn);
        libro.eliminar();
        response.sendRedirect("MostrarLibros.jsp");
%>
