package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
// import java.util.Map;
import model.Phieumuon447;
import model.ChitietPhieumuon447;

public class PhieumuonDAO447 extends DAO447 {

    // Hàm lưu phiếu mượn và chi tiết phiếu mượn
    public boolean luuPhieumuon(Phieumuon447 phieumuon, List<ChitietPhieumuon447> chitietPhieumuonList) {
        Connection conn = null;
        PreparedStatement stmtPhieumuon = null;
        PreparedStatement stmtChitietPhieumuon = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Lưu phiếu mượn vào bảng tblPhieumuon447
            String sqlPhieumuon = "INSERT INTO tblPhieumuon447 (tblNhanvienthuvien447id, tblDocgia447id) VALUES (?, ?)";
            stmtPhieumuon = conn.prepareStatement(sqlPhieumuon, Statement.RETURN_GENERATED_KEYS);
            stmtPhieumuon.setInt(1, phieumuon.getTblNhanvienthuvien447id());
            stmtPhieumuon.setInt(2, phieumuon.getTblDocgia447id());
            stmtPhieumuon.executeUpdate();

            // Lấy id của phiếu mượn vừa lưu
            rs = stmtPhieumuon.getGeneratedKeys();
            int phieumuonId = 0;
            if (rs.next()) {
                phieumuonId = rs.getInt(1);
            }

            // Lưu chi tiết phiếu mượn vào bảng tblChitietPhieumuon447
            String sqlChitietPhieumuon = "INSERT INTO tblChitietPhieumuon447 (tblTailieu447id, tblPhieumuon447id, ngaymuon, ngaytradukien) VALUES (?, ?, ?, ?)";
            stmtChitietPhieumuon = conn.prepareStatement(sqlChitietPhieumuon);
            for (ChitietPhieumuon447 chitiet : chitietPhieumuonList) {
                chitiet.setTblPhieumuon447id(phieumuonId); // Cập nhật id của phiếu mượn cho chi tiết phiếu mượn
                stmtChitietPhieumuon.setInt(1, chitiet.getTblTailieu447id());
                stmtChitietPhieumuon.setInt(2, chitiet.getTblPhieumuon447id());
                stmtChitietPhieumuon.setDate(3, new java.sql.Date(chitiet.getNgaymuon().getTime()));
                stmtChitietPhieumuon.setDate(4, new java.sql.Date(chitiet.getNgaytradukien().getTime()));
                stmtChitietPhieumuon.addBatch();
            }
            stmtChitietPhieumuon.executeBatch();

            conn.commit(); // Commit transaction
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback transaction nếu có lỗi
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            closeResources(rs, stmtPhieumuon, conn);
            closeResources(null, stmtChitietPhieumuon, null);
        }
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
