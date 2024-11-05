package dao;
// import model.Nguoidung447;
import model.Nhanvienthuvien447;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NhanvienthuvienDAO447 extends DAO447 {

    // Lấy thông tin nhân viên thư viện bao gồm họ tên, ngày sinh, giới tính, email, số điện thoại và địa chỉ qua khóa ngoại tblNhanvien447id
    public Nhanvienthuvien447 getNVtheoMa(int tblNguoidung447Id) {
        Nhanvienthuvien447 nhanvienthuvien = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            String sql = "SELECT nd.id, nd.tendangnhap, nd.matkhau, nd.hoten, nd.ngaysinh, nd.gioitinh, nd.email, nd.sodienthoai, nd.diachi, nd.vaitro, nv.maNV, nv.vitri, nvtv.tblThuvien447id " +
                         "FROM tblNguoidung447 nd " +
                         "JOIN tblNhanvien447 nv ON nd.id = nv.tblNguoidung447Id " +
                         "JOIN tblNhanvienthuvien447 nvtv ON nv.tblNguoidung447Id = nvtv.tblNhanvien447id " +
                         "WHERE nd.id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, tblNguoidung447Id);
            rs = stmt.executeQuery();
            // Kiểm tra kết quả trả về
            if (rs.next()) {
                nhanvienthuvien = new Nhanvienthuvien447(
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
                    rs.getString("vitri"),
                    tblNguoidung447Id,
                    rs.getInt("tblThuvien447id"),
                    rs.getInt("tblNhanvien447id")
                );
                nhanvienthuvien.setMaNV(rs.getString("maNV"));
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
        return nhanvienthuvien;
    }
}
