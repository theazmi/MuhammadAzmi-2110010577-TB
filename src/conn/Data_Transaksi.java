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
public class Data_Transaksi {
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    
    private String sql;
    public String no_transaksi;
    public String lama_sewa;
    public String harga;
    public String total;
    public String id_mobil;
    public String no_ktp;
    
   
    
    public void simpan()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "INSERT INTO transaksi(no_transaksi,no_ktp,id_mobil,lama_sewa,harga,total)VALUES(?,?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1,no_transaksi);
        pst.setString(2, no_ktp);
        pst.setString(3, id_mobil);
        pst.setString(4,lama_sewa);
        pst.setString(5,harga);
        pst.setString(6,total);      
        pst.execute();
        pst.close();
    }
    
    public void edit()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "UPDATE transaksi set no_ktp=?, id_mobil=?, lama_sewa=?, harga=?, total=? where no_transaksi=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1,no_ktp);
        pst.setString(2, id_mobil);
        pst.setString(3,lama_sewa);
        pst.setString(4,harga);
        pst.setString(5,total);
        pst.setString(6,no_transaksi);
        pst.execute();
        pst.close();
    }
    
    public void hapus() throws SQLException{
        conn=koneksi.getKoneksi();
        String sql="DELETE from transaksi where no_transaksi=?";
        try{
            pst=conn.prepareStatement(sql);
            pst.setString(1, no_transaksi);
            pst.execute();
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public ResultSet UpdatedatamobilT()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "SELECT transaksi.*, data_penyewa.nama_penyewa, data_mobil.nama_mobil FROM data_penyewa LEFT JOIN transaksi ON data_penyewa.no_ktp = transaksi.no_ktp JOIN data_mobil ON transaksi.id_mobil = data_mobil.id_mobil";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        return rs;
    } 
    
}
