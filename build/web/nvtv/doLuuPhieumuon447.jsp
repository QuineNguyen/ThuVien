<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Nhanvienthuvien447"%>
<%@page import="model.Thethuvien447"%>
<%@page import="model.Phieumuon447"%>
<%@page import="model.ChitietPhieumuon447"%>
<%@page import="dao.PhieumuonDAO447"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    Nhanvienthuvien447 nhanvien = (Nhanvienthuvien447)session.getAttribute("Nhan vien");
    Thethuvien447 thethuvien = (Thethuvien447)session.getAttribute("Thethuvien");
    List<Map<String, String>> danhSachMuon = (List<Map<String, String>>)session.getAttribute("danhSachMuon");

    if(nhanvien == null || thethuvien == null || danhSachMuon == null || danhSachMuon.isEmpty()){
        response.sendRedirect("gdQuanlyMuonTL447.jsp?err=nodata");
        return;
    }

    Phieumuon447 phieumuon = new Phieumuon447(0, nhanvien.getTblNguoidung447Id(), thethuvien.getTblDocgia447id());
    List<ChitietPhieumuon447> chitietPhieumuonList = new ArrayList<>();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    for (Map<String, String> muonInfo : danhSachMuon) {
        int tailieuId = Integer.parseInt(muonInfo.get("maTL").replaceAll("\\D", ""));
        Date ngayMuon = new Date();
        Date ngayTraDuKien = sdf.parse(muonInfo.get("ngayTraDuKien"));
        ChitietPhieumuon447 chitiet = new ChitietPhieumuon447(0, tailieuId, 0, ngayMuon, ngayTraDuKien, null);
        chitietPhieumuonList.add(chitiet);
    }

    PhieumuonDAO447 phieumuonDAO = new PhieumuonDAO447();
    boolean success = phieumuonDAO.luuPhieumuon(phieumuon, chitietPhieumuonList);

    if (success) {
%>
        <script>
            alert('Phiếu mượn đã được lưu thành công');
            window.location.href = 'gdChinhNV447.jsp';
        </script>
<%
    } else {
%>
        <script>
            alert('Lưu phiếu mượn thất bại');
            window.location.href = 'gdChinhNV447.jsp';
        </script>
<%
    }
%>