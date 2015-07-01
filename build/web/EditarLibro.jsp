<%-- 
    Document   : EditarLibro
    Created on : Jun 30, 2015, 5:39:05 PM
    Author     : Daniel Fuentes
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.curso.model.Libro"%>
<%
    String isbn = request.getParameter("isbn");
    Libro libro = new Libro();
    libro.setIsbn(isbn);
    libro = libro.findByIsbn();
    List<String> categorias = Libro.listarCategorias();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Libro</title>
    </head>
    <body>
        <h1>Editar Libro</h1>
          <form id="formBook" name="formBookEdit" action="guardarLibro.jsp" method="get">
           <label>ISBN</label> 
           <input readonly type="text" id="isbn" name="isbn" value="<%=libro.getIsbn() %>" ><br>
           <label>Titulo</label> 
           <input type="text" id="titulo" name="titulo"  value="<%=libro.getTitulo() %>"><br>
           <label>Categoria</label> 
           <select id="categoria">
               <option value="n/a">Seleccione</option>
               <%                
               for(String categoria:categorias)
               {
                if(categoria.equals(libro.getCategoria()))
               	{
               	%>
                       <option selected value="<%=categoria%> "><%=categoria%></option>	
                   	<%
               	}
               	else
               	{
               	%>
                       <option value="<%=categoria%> "><%=categoria%></option>	
                   	<%
               	}
               }
               %>
           </select><br>
           <input type="submit" value="Guardar">
       </form>
    </body>
</html>
