import java.sql.*;
import java.util.Scanner;

public class JDBCMysSQLConnection {
	
	public static int ObtenerOperacion(connection conexion, Scanner input) {
			System.out.println("Introduzca una opcion\n"
					+ "1.Consultar información de un usuario.\n"
					+ "2.Agregar usuarios\n"
					+ "3.Eliminar usuario\n");
			int option = Integer.parseInt(input.nextLine());
			return option;
	}
	
	public static void Menu(connection conexion) throws SQLException {
		Scanner input = new Scanner(System.in);
		String respuesta = "yes";
		while(respuesta.compareTo("yes")==0){
			int opcion = ObtenerOperacion(conexion, input);
			RealizarOperacion(opcion, conexion, input);	
			System.out.println("Desea realizar otra operacion(yes/no)?");
			respuesta = input.nextLine();
		}
	}
	
	public static String ObtenerNombreUsuario(Scanner input) {
		System.out.println("Introduzca el nombre de usuario");
		return input.nextLine();
	}
	
	public static String[] DatosNuevoUsuario(Scanner input) {
		String datos[] = new String[7];
		datos[0] = "Introduzca el nombre de usuario";
		datos[1] = "Introduzca la contraseña";
		datos[2] = "Introduzca el nombre";
		datos[3] = "Introduzca los apellidos";
		datos[4] = "Introduzca el dni";
		datos[5] = "Introduzca la fecha de nacimiento";
		datos[6] = "Introduzca el id_rol";
		for(int i = 0; i < 7; ++i) {
			System.out.println(datos[i]);
			datos[i] = input.nextLine();
		}
		return datos;
	}
	
	public static void RealizarOperacion(int opcion, connection conexion, Scanner input) throws SQLException {
		String[] datos = new String[8];
		switch(opcion) {
		case 1:
			datos[0] = ObtenerNombreUsuario(input);
			conexion.Consulta(datos[0]);
			break;
		case 2:
			datos = DatosNuevoUsuario(input);
			conexion.Agregar(datos);
			break;
		case 3:
			datos[0] = ObtenerNombreUsuario(input);
			conexion.Eliminar(datos[0]);
			break;
		}
	}
	
	public static void main(String args[]) throws SQLException {
		connection conexion = new connection();
		conexion.apertura();
		Menu(conexion);
		System.out.println("-------------------------");
		conexion.close();
	}
}
