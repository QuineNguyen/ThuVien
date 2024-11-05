<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Nhanvienthuvien447"%>
<%@page import="model.Thethuvien447"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    Nhanvienthuvien447 nhanvien = (Nhanvienthuvien447)session.getAttribute("Nhan vien");
    if(nhanvien == null){
        response.sendRedirect("/PTTK/gdDangnhap447.jsp?err=timeout");
        return;
    }

    Thethuvien447 thethuvien = (Thethuvien447)session.getAttribute("Thethuvien");
    List<Map<String, String>> danhSachMuon = (List<Map<String, String>>)session.getAttribute("danhSachMuon");

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý việc mượn tài liệu</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ff3d3d;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            text-align: center;
        }

        h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        button {
            font-size: 16px;
            padding: 10px 10px;
            background-color: #ff3d3d;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 10px 0;
            width: 150px;
        }

        button:hover {
            background-color: #e53935;
        }

        .back-link {
            display: inline-block;
            color: #0077cc;
            text-decoration: none;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .back-link-container {
            text-align: center;
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .thethuvien-info {
            margin-top: 20px;
            text-align: left;
        }

        .thethuvien-info p {
            margin: 5px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #ff3d3d;
            color: #fff;
            text-align: center;
        }

        tr:nth-child(1), tr:nth-child(2), tr:nth-child(4), tr:nth-child(5) {
            text-align: center;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .button-container {
            margin-top: 20px;
        }

        .error-message {
            color: red;
            margin-top: 20px;
        }
    </style>
    <script>
        function checkDocgia() {
            var docgiaInfo = document.getElementById("docgia-info");
            if (!docgiaInfo) {
                alert("Bạn chưa quét thẻ độc giả");
                return false;
            }
            window.location.href = 'gdQuetMaTL447.jsp';
        }

        function checkDanhSachMuon() {
            var danhSachMuon = <%= (danhSachMuon != null && !danhSachMuon.isEmpty()) ? "true" : "false" %>;
            if (!danhSachMuon) {
                alert("Chưa có tài liệu nào trong danh sách mượn");
                return false;
            }
            window.location.href = 'gdInPhieumuon447.jsp';
        }
    </script>
</head>
<body>

    <div class="container">
        <h1>Quản lý việc mượn tài liệu</h1>
        <% if (thethuvien != null) { %>
            <div id="docgia-info" class="thethuvien-info">
                <p><strong>Mã độc giả:</strong> <%= thethuvien.getMadocgia() %></p>
                <p><strong>Tên:</strong> <%= thethuvien.getHoten() %></p>
            </div>
        <% } %>
        <% if (danhSachMuon != null && !danhSachMuon.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>Thứ tự</th>
                        <th>Mã tài liệu</th>
                        <th>Tên tài liệu</th>
                        <th>Ngày mượn</th>
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
                            <td>
                                <%
                                    try {
                                        out.print(muonInfo.get("ngayMuon"));
                                    } catch (Exception e) {
                                        out.print("N/A");
                                    }
                                %>
                            </td>
                            <td>
                                <%
                                    try {
                                        Date ngayTraDuKien = inputFormat.parse(muonInfo.get("ngayTraDuKien"));
                                        out.print(sdf.format(ngayTraDuKien));
                                    } catch (Exception e) {
                                        out.print("N/A");
                                    }
                                %>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
        <div class="button-container">
            <button onclick="window.location.href='gdQuetTheDG447.jsp'">Quét thẻ độc giả</button>
            <button onclick="checkDocgia()">Quét mã tài liệu</button>
            <button onclick="checkDanhSachMuon()">In phiếu mượn</button>
        </div>
        <div class="back-link-container">
            <a href="gdChinhNV447.jsp" class="back-link">Quay lại</a>
        </div>
    </div>
</body>
</html>