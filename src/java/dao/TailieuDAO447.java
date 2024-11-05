package dao;

import model.Tailieu447;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class TailieuDAO447 extends DAO447 {

    // Hàm tìm kiếm tài liệu theo tên từ khóa
    public List<Tailieu447> getTLtheoTen(String tenTimkiem) {
        List<Tailieu447> documents = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection(); // Mở kết nối tới cơ sở dữ liệu
            // Câu truy vấn sử dụng JOIN để lấy tên nhà xuất bản từ bảng Nhaxuatban447
            String sql = "SELECT t.*, n.ten AS nhaxuatban FROM tblTailieu447 t " +
                         "JOIN tblNhaxuatban447 n ON t.tblNhaxuatban447id = n.id " +
                         "WHERE t.ten LIKE ?"; 
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + tenTimkiem + "%"); // Sử dụng từ khóa với wildcard để tìm kiếm theo tên
            rs = stmt.executeQuery(); // Thực thi truy vấn

            // Duyệt qua kết quả trả về và thêm vào danh sách documents
            while (rs.next()) {
                System.out.println("Found document: " + rs.getString("ten"));
                Tailieu447 document = new Tailieu447(
                    rs.getInt("id"),
                    rs.getString("ten"),
                    rs.getInt("namxuatban"),
                    rs.getInt("soTrang"),
                    rs.getString("ngonNgu"),
                    rs.getString("theloai"),
                    rs.getInt("tblNhaxuatban447id")
                );
                documents.add(document);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, conn); // Đóng tài nguyên sau khi truy vấn
        }

        return documents; // Trả về danh sách tài liệu tìm thấy
    }
    
    public Tailieu447 getTailieuTheoMa(int id) {
        Tailieu447 document = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection(); // Mở kết nối tới cơ sở dữ liệu
            String sql = "SELECT t.*, n.ten AS nhaxuatban FROM tblTailieu447 t " +
                         "JOIN tblNhaxuatban447 n ON t.tblNhaxuatban447id = n.id " +
                         "WHERE t.id = ?"; // Truy vấn dựa trên id
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id); 
            rs = stmt.executeQuery();

            // Kiểm tra kết quả trả về
            if (rs.next()) {
                document = new Tailieu447(
                    rs.getInt("id"),
                    rs.getString("ten"),
                    rs.getInt("namxuatban"),
                    rs.getInt("soTrang"),
                    rs.getString("ngonNgu"),
                    rs.getString("theloai"),
                    rs.getInt("tblNhaxuatban447id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, conn); // Đóng tài nguyên sau khi truy vấn
        }

        return document; // Trả về tài liệu tìm thấy hoặc null
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