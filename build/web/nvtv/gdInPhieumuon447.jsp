<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Nhanvienthuvien447"%>
<%@page import="model.Thethuvien447"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    Nhanvienthuvien447 nhanvien = (Nhanvienthuvien447)session.getAttribute("Nhan vien");
    Thethuvien447 thethuvien = (Thethuvien447)session.getAttribute("Thethuvien");
    List<Map<String, String>> danhSachMuon = (List<Map<String, String>>)session.getAttribute("danhSachMuon");

    if(nhanvien == null || thethuvien == null || danhSachMuon == null || danhSachMuon.isEmpty()){
        response.sendRedirect("gdQuanlyMuonTL447.jsp?err=nodata");
        return;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String ngayMuon = sdf.format(new Date());
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>In phiếu mượn</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('/PTTK/img/ptitnen.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(195, 0, 0, 0.3); /* Màu đỏ với mức độ trong suốt */
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            color: #333;
            margin: 10px;
        }

        .table-container {
            max-height: 400px;
            overflow-y: auto;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 2px solid #333;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #ff3d3d;
            color: #fff;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .info-table {
            width: 50%; /* Điều chỉnh chiều rộng của bảng thông tin độc giả */
            margin: 0 auto; /* Căn giữa bảng */
            text-align: left; /* Căn trái nội dung bảng */
        }

        button {
            font-size: 16px;
            padding: 10px 20px;
            background-color: #ff3d3d;
            color: white;
            border: 2px solid #333;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 10px 5px 5px 5px;
        }

        button:hover {
            background-color: #e53935;
        }

        .back-button-container {
            display: flex;
            justify-content: center; /* Căn giữa nút Quay lại */
            margin-top: 5px;
        }

        .back-button {
            background-color: #d3d3d3; /* Màu xám nhạt */
            color: #333;
        }

        .back-button:hover {
            background-color: #b0b0b0; /* Màu xám đậm hơn khi hover */
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="/PTTK/img/logo.png" alt="Logo" style="width: 100px"> <!-- Add logo -->
        <h1>Phiếu mượn tài liệu</h1>
        <div class="table-container">
            <table class="info-table">
                <tr>
                    <th>Mã độc giả</th>
                    <td><%= thethuvien.getMadocgia() %></td>
                </tr>
                <tr>
                    <th>Họ tên</th>
                    <td><%= thethuvien.getHoten() %></td>
                </tr>
                <tr>
                    <th>Ngày sinh</th>
                    <td><%= sdf.format(thethuvien.getNgaysinh()) %></td>
                </tr>
                <tr>
                    <th>Giới tính</th>
                    <td><%= thethuvien.isGioitinh() ? "Nam" : "Nữ" %></td>
                </tr>
                <tr>
                    <th>Ngày mượn</th>
                    <td><%= ngayMuon %></td>
                </tr>
                <tr>
                    <th>Người cho mượn</th>
                    <td><%= nhanvien.getHoten() %></td>
                </tr>
            </table>
        </div>
        <h2>Danh sách tài liệu mượn</h2>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Thứ tự</th>
                        <th>Mã tài liệu</th>
                        <th>Tên tài liệu</th>
                        <th>Ngày trả dự kiến</th>
                    </tr>
                </thead>
                <tbody>
                    <% int index = 1; %>
                    <% for (Map<String, String> muonInfo : danhSachMuon) { %>
                        <tr>
                            <td><%= index++ %></td>
                            <td><%= muonInfo.get("maTL") %></td>
                            <td><%= muonInfo.get("tenTL") %></td>
                            <td><%= sdf.format(new SimpleDateFormat("yyyy-MM-dd").parse(muonInfo.get("ngayTraDuKien"))) %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <form action="doLuuPhieumuon447.jsp" method="post">
            <button type="submit">Lưu</button>
        </form>
        <div class="back-link-container">
            <button class="back-button" onclick="window.location.href='gdQuanlyMuonTL447.jsp'">Quay lại</button>
        </div>
    </div>

</body>
</html>