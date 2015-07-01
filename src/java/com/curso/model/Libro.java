package com.curso.model;

import java.util.List;

import com.curso.database.DataBaseHelper;

public class Libro {

    private String isbn;
    private String titulo;
    private String categoria;

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int insertar() {
        return ejecutarOperacion(String.format("insert into libros (isbn, titulo, categoria) values ('%s', '%s', '%s')", isbn, titulo, categoria));
    }

    public int modificar() {
        return ejecutarOperacion(String.format("update libros set titulo = '%s', categoria = '%s' where isbn = '%s'", titulo, categoria, isbn));
    }

    public int eliminar() {
        return ejecutarOperacion(String.format("delete from libros where isbn = '%s'", isbn));
    }

    public Libro findByIsbn() {
        List<Libro> list = ejecutarConsulta(String.format("select isbn,titulo,categoria from libros where isbn = '%s'", isbn),Libro.class);
        return list.get(0);
    }
    
    public static List<Libro> listar() {
        return ejecutarConsulta("select isbn, titulo, categoria from libros", Libro.class);
    }

    public static List<String> listarCategorias() {
        return ejecutarConsulta("select distinct categoria from libros", String.class);
    }

    private int ejecutarOperacion(String sql) {
        DataBaseHelper helper = new DataBaseHelper();
        return helper.modificarRegistro(sql);
    }

    private static <T> List<T> ejecutarConsulta(String sql, Class clazz) {
        DataBaseHelper helper = new DataBaseHelper();
        return helper.seleccionarRegistros(sql, clazz);
    }

}
