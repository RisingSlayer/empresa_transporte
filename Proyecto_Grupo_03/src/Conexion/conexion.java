package Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
     public static Connection conectar() {
        String conexionURL = "jdbc:sqlserver://DESKTOP-HIJ8VK1\\SQLEXPRESS:1433;"
                + "database=GRTransportista;"
                + "user=sa;"
                + "password=12345678;"
                + "logintTimeout=30;"
                + "TrustServerCertificate=True;";
        try{
            Connection con = DriverManager.getConnection(conexionURL);
            return con;
        }catch(SQLException ex){
            System.out.println(ex.toString());
            return null;
        }
    }
}
