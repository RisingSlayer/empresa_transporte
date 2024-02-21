/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Formularios;
import java.sql.Statement;
import java.sql.ResultSet;
import Conexion.conexion;
import javax.swing.JOptionPane;
import java.sql.SQLException;
import java.sql.Connection;
/**
 *
 * @author Acer
 */
public class Mi_Perfil extends javax.swing.JFrame {
    String codigo;
    conexion cc = new conexion();
    Connection con = cc.conectar();
    /**
     * Creates new form Mi_Perfil
     */
    public Mi_Perfil() {
        initComponents();
        setLocationRelativeTo(null);//Centrar
    }
    
    public Mi_Perfil(String codigo) {
        initComponents();
        setLocationRelativeTo(null);//Centrar
        this.codigo=codigo;
        mostrarDatos();
    }
    
public void mostrarDatos() {
    String SQLNombre = "SELECT NOM_COND FROM conductor WHERE COD_COND='" + codigo + "'";
    String SQLApellido = "SELECT APE_COND FROM conductor WHERE COD_COND='" + codigo + "'";
    String SQLDNI = "SELECT DNI_COND FROM conductor WHERE COD_COND='" + codigo + "'";
    String SQLTelefono = "SELECT TEL_COND FROM conductor WHERE COD_COND='" + codigo + "'";
    String SQLLicencia = "SELECT LIC_COND FROM conductor WHERE COD_COND='" + codigo + "'";
    String SQLCatalogo = "SELECT CATG_LIC FROM conductor WHERE COD_COND='" + codigo + "'";

    try {
        Statement st = con.createStatement();

        // Obtener el nombre
        ResultSet rsNombre = st.executeQuery(SQLNombre);
        if (rsNombre.next()) {
            String nombre = rsNombre.getString("NOM_COND");
            jTextField1.setText(nombre);
        }

        // Obtener el apellido
        ResultSet rsApellido = st.executeQuery(SQLApellido);
        if (rsApellido.next()) {
            String apellido = rsApellido.getString("APE_COND");
            jTextField2.setText(apellido);
        }

        // Obtener el DNI
        ResultSet rsDNI = st.executeQuery(SQLDNI);
        if (rsDNI.next()) {
            int dni = rsDNI.getInt("DNI_COND");
            jTextField3.setText(String.valueOf(dni));
        }

        // Obtener el teléfono
        ResultSet rsTelefono = st.executeQuery(SQLTelefono);
        if (rsTelefono.next()) {
            int telefono = rsTelefono.getInt("TEL_COND");
            jTextField4.setText(String.valueOf(telefono));
        }

        // Obtener la licencia
        ResultSet rsLicencia = st.executeQuery(SQLLicencia);
        if (rsLicencia.next()) {
            String licencia = rsLicencia.getString("LIC_COND");
            jTextField5.setText(licencia);
        }

        // Obtener la categoría de licencia
        ResultSet rsCatalogo = st.executeQuery(SQLCatalogo);
        if (rsCatalogo.next()) {
            String catalogo = rsCatalogo.getString("CATG_LIC");
            jTextField6.setText(catalogo);
        }
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, "Error de Registro " + e.getMessage());
    }
}

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jTextField6 = new javax.swing.JTextField();
        jTextField5 = new javax.swing.JTextField();
        jTextField4 = new javax.swing.JTextField();
        jTextField3 = new javax.swing.JTextField();
        jTextField2 = new javax.swing.JTextField();
        jButton3 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel2.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel2.setText("MI PERFIL");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 20, -1, -1));
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 250, 460, -1));

        jLabel3.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel3.setText("NOMBRE: ");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 250, -1, -1));

        jLabel4.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel4.setText("CÓDIGO: ");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 280, -1, -1));

        jLabel5.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel5.setText("DNI: ");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 310, -1, -1));

        jLabel6.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel6.setText("TELÉFONO: ");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 340, -1, -1));

        jLabel7.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel7.setText("LICENCIA DE CONDUCIR: ");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 370, -1, -1));

        jLabel8.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jLabel8.setText("CATEGORÍA");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 400, -1, -1));
        jPanel1.add(jTextField6, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 400, 460, -1));
        jPanel1.add(jTextField5, new org.netbeans.lib.awtextra.AbsoluteConstraints(310, 370, 350, -1));
        jPanel1.add(jTextField4, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 340, 460, -1));
        jPanel1.add(jTextField3, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 310, 460, -1));
        jPanel1.add(jTextField2, new org.netbeans.lib.awtextra.AbsoluteConstraints(200, 280, 460, -1));

        jButton3.setBackground(new java.awt.Color(153, 51, 255));
        jButton3.setFont(new java.awt.Font("Segoe UI", 1, 18)); // NOI18N
        jButton3.setText("REGRESAR");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 460, -1, -1));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Imagenes/i_miperfil.png"))); // NOI18N
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 750, 510));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        new Bienvenida(codigo).setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jButton3ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Mi_Perfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Mi_Perfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Mi_Perfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Mi_Perfil.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Mi_Perfil().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    // End of variables declaration//GEN-END:variables
}