import java.sql.*;

import com.mysql.jdbc.PreparedStatement;

public class connection {
	private Connection conexion = null;
	private Statement operacion = null;
	private ResultSet resultado = null;
	private PreparedStatement sentencia = null;
	private static final String URL = "jdbc:mysql://localhost/p7";
	private static final String USER = "root";
	private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	
	/*
	 * Metodo para crear la conexion con la base de datos
	 */
	public void apertura() throws SQLException {
		try {
			//Clase de la base de datos que voy a utilizar en mi db.
			Class.forName(DRIVER_CLASS);
			//Configuracion de base de datos en remoto desde java.
			conexion = DriverManager.getConnection(URL, USER, PASSWORD);
			//Apertura de la conexion a traves de un objeto statement.
			operacion = conexion.createStatement();
		}catch(ClassNotFoundException e) {
			System.out.println("Error unable to connect");
		}
		
	}
	
	
	/**
	 * Metodo para realizar consultas
	 */
	public void Consulta(String user_name) {
		try {
			sentencia = (PreparedStatement) conexion.prepareStatement("select nombre, apellidos from p7.Usuario where nombre_usuario = ? ");
			sentencia.setString(1, user_name);
			resultado = sentencia.executeQuery();
			ImprimeResultado(resultado);
		}
		catch(Exception e) {
			System.out.println("Fallo al consultar el usuario");
		}
	}
	
	/**
	 * Metodo private para ver los resultados de las consultas
	 * @param resultado
	 * @throws SQLException 
	 */
	private void ImprimeResultado(ResultSet resultado) throws SQLException {
		while(resultado.next()) {
			System.out.println("Resultado : ");
			System.out.println("-----------------");			
			for(int i = 1;i <= resultado.getMetaData().getColumnCount();i++) {
				System.out.println("Column " + resultado.getMetaData().getColumnName(i) + ": " + resultado.getString(i));				
			}
			System.out.println("-----------------");
		}
	}

	
	/**
	 * 
	 * @param value1
	 * @throws SQLException 
	 */
	public void Eliminar(String value1) throws SQLException {
		try {
			sentencia = (PreparedStatement) conexion.prepareStatement("delete from p7.Usuario where nombre_usuario = ?");
			sentencia.setString(1, value1);
			sentencia.executeUpdate();
		}
		catch(SQLException S) {
			System.out.println("Error en el eliminado");
		}
	}
	
	/**
	 * 
	 * @param value1
	 * @param value2
	 * @param value3
	 * @param value4
	 * @param value5
	 */
	public void Agregar(String[] datos) {
		try {
			sentencia = (PreparedStatement) conexion.prepareStatement("select max(id) from p7.Usuario");
			resultado = sentencia.executeQuery();
			while(!resultado.next());
			int last_id = Integer.parseInt(resultado.getString(1)) + 1;
			sentencia = (PreparedStatement) conexion.prepareStatement("insert into p7.Usuario values(?,?,?,?,?,?,?,?)");
			sentencia.setString(1, Integer.toString(last_id));
			for(int i = 1;i < 8;++i) {
				System.out.println(datos[i - 1]);
				sentencia.setString(i + 1, datos[i - 1]);
			}
			sentencia.executeUpdate();
			System.out.println("Nuevo usuario creado");
		}
		catch(SQLException S) {
			S.printStackTrace();
		}
	}
	
	/*
	 * Metodo de cierre de la conexion con la BD:
	 * @throws SQLException
	 */
	public void close() throws SQLException{
		try {
			if(resultado != null) {
				resultado.close();
			}
			if(operacion != null) {
				operacion.close();
			}
			if(conexion != null) {
				conexion.close();
			}
		}
		catch(SQLException S) {
			S.printStackTrace();
		}
	}
	
	private static final String PASSWORD = "anythingyou12";
}
