/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class Data_Penyewa {
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    
    private String sql;
    public String no_ktp;
    public String nama_penyewa;
    public String alamat;
    public String no_hp;
    public String jenkel;
   
    
    public void simpan()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "INSERT INTO data_penyewa(no_ktp,nama_penyewa,alamat,no_hp,jenkel) VALUES(?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1,no_ktp);
        pst.setString(2,nama_penyewa);
        pst.setString(3,alamat);
        pst.setString(4,no_hp);      
        pst.setString(5,jenkel);
      pst.executeUpdate();
    }
    
    public void edit()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "UPDATE data_penyewa set nama_penyewa=?, alamat=?, no_hp=? ,jenkel=? where no_ktp=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1,nama_penyewa);
        pst.setString(2,alamat);
        pst.setString(3,no_hp);
        pst.setString(4,jenkel);
        pst.setString(5,no_ktp);
        
        pst.execute();
        pst.close();
    }
    
    public void hapus() throws SQLException{
        conn=koneksi.getKoneksi();
        String sql="DELETE from data_penyewa where no_ktp=?";
        try{
            pst=conn.prepareStatement(sql);
            pst.setString(1, no_ktp);
            pst.execute();
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public ResultSet UpdatedatamobilT()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "select no_ktp,nama_penyewa,alamat,no_hp,jenkel from data_penyewa";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        return rs;
    } 
    
}
