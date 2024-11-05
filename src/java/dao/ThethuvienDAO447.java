package dao;

import model.Thethuvien447;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ThethuvienDAO447 extends DAO447 {

    public Thethuvien447 getThethuvienByMaDocgia(String maDocgia) {
        Thethuvien447 thethuvien = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            // Tách mã độc giả thành hai phần
            // String prefix = maDocgia.substring(0, 2);
            int id = Integer.parseInt(maDocgia.substring(2));

            String sql = "SELECT tv.anhthe, tv.ngaydangky, dg.tblNguoidung447id, nd.id, nd.tendangnhap, nd.matkhau, nd.hoten, nd.ngaysinh, nd.gioitinh, nd.email, nd.sodienthoai, nd.diachi, nd.vaitro " +
                         "FROM tblThethuvien447 tv " +
                         "JOIN tblDocgia447 dg ON tv.tblDocgia447id = dg.tblNguoidung447id " +
                         "JOIN tblNguoidung447 nd ON dg.tblNguoidung447id = nd.id " +
                         "WHERE dg.tblNguoidung447id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                thethuvien = new Thethuvien447(
                    rs.getInt("id"),
                    rs.getString("tendangnhap"),
                    rs.getString("matkhau"),
                    rs.getString("hoten"),
                    rs.getDate("ngaysinh"),
                    rs.getBoolean("gioitinh"),
                    rs.getString("email"),
                    rs.getString("sodienthoai"),
                    rs.getString("diachi"),
                    rs.getString("vaitro"),
                    rs.getInt("tblNguoidung447id"),
                    rs.getString("anhthe"),
                    rs.getDate("ngaydangky"),
                    rs.getInt("tblNguoidung447id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return thethuvien;
    }
}
