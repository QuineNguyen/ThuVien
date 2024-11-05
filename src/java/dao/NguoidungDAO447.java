package dao;

import model.Nguoidung447;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
// import java.util.*;

public class NguoidungDAO447 extends DAO447 {

    public Nguoidung447 xacthuc(String tendangnhap, String matkhau) {
        Nguoidung447 user = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            String sql = "SELECT * FROM tblNguoidung447 WHERE tendangnhap = ? AND matkhau = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, tendangnhap);
            stmt.setString(2, matkhau);
            rs = stmt.executeQuery();
            if (rs.next()) {
                user = new Nguoidung447(
                    rs.getInt("id"),
                    rs.getString("tendangnhap"),
                    rs.getString("matkhau"),
                    rs.getString("hoten"),
                    rs.getDate("ngaysinh"),
                    rs.getBoolean("gioitinh"),
                    rs.getString("email"),
                    rs.getString("sodienthoai"),
                    rs.getString("diachi"),
                    rs.getString("vaitro")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, conn); // Đóng tài nguyên sau khi truy vấn
        }
        return user;
    }
    
    // Hàm đóng kết nối và tài nguyên sau khi thực thi truy vấn
    private void closeResources(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

