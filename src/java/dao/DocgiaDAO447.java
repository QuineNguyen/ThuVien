package dao;

import model.Docgia447;
// import model.Nguoidung447;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DocgiaDAO447 extends DAO447 {


    // Lấy thông tin độc giả bao gồm họ tên, ngày sinh, giới tính, email, số điện thoại và địa chỉ qua khóa ngoại tblNguoidung447Id
    public Docgia447 getDGtheoMa(int tblNguoidung447Id) {
        Docgia447 docgia = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            String sql = "SELECT nd.id, nd.tendangnhap, nd.matkhau, nd.hoten, nd.ngaysinh, nd.gioitinh, nd.email, nd.sodienthoai, nd.diachi, nd.vaitro, dg.madocgia " +
                         "FROM tblNguoidung447 nd " +
                         "JOIN tblDocgia447 dg ON nd.id = dg.tblNguoidung447Id " +
                         "WHERE dg.tblNguoidung447Id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, tblNguoidung447Id);
            rs = stmt.executeQuery();
            // Kiểm tra kết quả trả về
            if (rs.next()) {
                docgia = new Docgia447(
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
                    tblNguoidung447Id
                );
                docgia.setMadocgia(rs.getString("madocgia"));
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
        return docgia;
    }
}
