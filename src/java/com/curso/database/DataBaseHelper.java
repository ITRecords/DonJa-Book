package com.curso.database;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataBaseHelper<T> {

    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String URL_CONEXION = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USUARIO = "Arquitecto";
    private static final String PASSWORD = "daniel";

    public int modificarRegistro(String sql) {
        Connection conexion = null;
        Statement sentencia = null;

        int filas = 0;
        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL_CONEXION, USUARIO, PASSWORD);
            sentencia = conexion.createStatement();
            filas = sentencia.executeUpdate(sql);
        } catch (ClassNotFoundException e) {
            System.out.println("Error en la carga del driver" + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error accediendo a la base de datos" + e.getMessage());
        } finally {
            if (sentencia != null) {
                try {
                    sentencia.close();
                } catch (SQLException e) {
                    System.out.println("Error cerrando la sentencia" + e.getMessage());
                }
            }
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    System.out.println("Error cerrando la conexion" + e.getMessage());
                }
            }
        }

        return filas;
    }

    public List<T> seleccionarRegistros(String sql, Class clazz) {
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet rs = null;
        List<T> list = new ArrayList<T>();

        try {
            Class.forName(DRIVER);
            conexion = DriverManager.getConnection(URL_CONEXION, USUARIO, PASSWORD);
            sentencia = conexion.createStatement();
            rs = sentencia.executeQuery(sql);
            while (rs.next()) {
                T object = (T) Class.forName(clazz.getName()).newInstance();
                Method[] methods = object.getClass().getDeclaredMethods();
                for (int i = 0; i < methods.length; i++) {
                    if (methods[i].getName().startsWith("set")) {
                        methods[i].invoke(object, rs.getString(methods[i].getName().substring(3)));
                    }
                    if (object.getClass().getName().equals("java.lang.String")) {
                        object = (T) rs.getString(1);
                    }
                }

                list.add(object);
            }
        } catch (ClassNotFoundException e) {
            System.out.println("Error en la carga del driver" + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error accediendo a la base de datos" + e.getMessage());
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    System.out.println("Error cerrando el resultset" + e.getMessage());
                }
            }
            if (sentencia != null) {
                try {
                    sentencia.close();
                } catch (SQLException e) {
                    System.out.println("Error cerrando la sentencia" + e.getMessage());
                }
            }
            if (conexion != null) {
                try {
                    conexion.close();
                } catch (SQLException e) {
                    System.out.println("Error cerrando la conexion" + e.getMessage());
                }
            }
        }

        return list;
    }

}
