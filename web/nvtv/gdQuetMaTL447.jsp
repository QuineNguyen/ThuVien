<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Nhanvienthuvien447"%>
<%@page import="model.Tailieu447"%>
<%@page import="dao.TailieuDAO447"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
    Nhanvienthuvien447 nhanvien = (Nhanvienthuvien447)session.getAttribute("Nhan vien");
    if(nhanvien == null){
        response.sendRedirect("/PTTK/gdDangnhap447.jsp?err=timeout");
        return;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String formattedDate = sdf.format(nhanvien.getNgaysinh());

    String maTL = request.getParameter("maTL");
    Tailieu447 tailieu = null;
    boolean notFound = false;
    List<String> tenTacgiaList = new ArrayList<>();
    if (maTL != null && !maTL.isEmpty()) {
        try {
            // Tách phần chữ và phần số
            String prefix = maTL.replaceAll("\\d", "");
            int id = Integer.parseInt(maTL.replaceAll("\\D", ""));
            
            TailieuDAO447 tailieuDAO = new TailieuDAO447();
            tailieu = tailieuDAO.getTailieuTheoMa(id);
            if (tailieu != null) {
                // Lấy danh sách tác giả của tài liệu
                try {
                    Connection conn = tailieuDAO.getConnection();
                    String sqlTacgia = "SELECT tg.ten FROM tblTacgia447 tg JOIN tblTacgiaTailieu447 tgtl ON tg.id = tgtl.tblTacgia447id WHERE tgtl.tblTailieu447id = ?";
                    PreparedStatement stmtTacgia = conn.prepareStatement(sqlTacgia);
                    stmtTacgia.setInt(1, tailieu.getId());
                    ResultSet rsTacgia = stmtTacgia.executeQuery();
                    while (rsTacgia.next()) {
                        tenTacgiaList.add(rsTacgia.getString("ten"));
                    }
                    rsTacgia.close();
                    stmtTacgia.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                notFound = true;
            }
        } catch (NumberFormatException e) {
            notFound = true;
        }
    }

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String ngayTraDuKien = request.getParameter("ngayTraDuKien");
        String ngayMuon = sdf.format(new Date());
        if (tailieu != null && ngayTraDuKien != null && !ngayTraDuKien.isEmpty()) {
            List<Map<String, String>> danhSachMuon = (List<Map<String, String>>) session.getAttribute("danhSachMuon");
            if (danhSachMuon == null) {
                danhSachMuon = new ArrayList<>();
            }
            Map<String, String> muonInfo = new HashMap<>();
            muonInfo.put("maTL", tailieu.getMaTL());
            muonInfo.put("tenTL", tailieu.getTen());
            muonInfo.put("ngayMuon", ngayMuon);
            muonInfo.put("ngayTraDuKien", ngayTraDuKien);
            danhSachMuon.add(muonInfo);
            session.setAttribute("danhSachMuon", danhSachMuon);
            response.sendRedirect("gdQuanlyMuonTL447.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quét mã tài liệu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
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

        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            max-width: 400px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #00aaff;
        }

        input[type="submit"] {
            padding: 12px 20px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0077cc;
        }

        button {
            font-size: 16px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
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

        .error-message {
            color: red;
            margin-top: 20px;
        }

        .tailieu-info {
            margin-top: 20px;
            text-align: left;
        }

        .tailieu-info p {
            margin: 5px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f9;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-container label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        .form-container input[type="date"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            text-align: center;
        }

        .button-container {
            margin-top: 10px; /* Thêm khoảng cách phía trên nút */
            margin-left: 90px;
        }
    </style>
    <script>
        function checkTailieu() {
            var tailieuInfo = document.getElementById("tailieu-info");
            if (!tailieuInfo) {
                alert("Bạn chưa xác nhận tài liệu");
                return false;
            }
            var ngayTraDuKien = document.getElementById("ngayTraDuKien").value;
            var today = new Date();
            var traDuKienDate = new Date(ngayTraDuKien);
            if (traDuKienDate <= today) {
                alert("Ngày trả dự kiến phải sau ngày mượn ít nhất 1 ngày");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <div class="container">
        <h1>Quét mã tài liệu</h1>
        <div class="search-container">
            <form action="gdQuetMaTL447.jsp" method="get" style="display: flex; align-items: center;">
                <input type="text" name="maTL" placeholder="Nhập mã tài liệu" value="<%= request.getParameter("maTL") != null ? request.getParameter("maTL") : "" %>" required>
                <input type="submit" value="Tìm kiếm">
            </form>
        </div>
        <% if (tailieu != null) { %>
            <div id="tailieu-info" class="tailieu-info">
                <h3>Thông tin chi tiết tài liệu</h3>
                <div class="table-container">
                    <table>
                        <tr>
                            <th>Mã tài liệu</th>
                            <td><%= tailieu.getMaTL() %></td>
                        </tr>
                        <tr>
                            <th>Tên tài liệu</th>
                            <td><%= tailieu.getTen() %></td>
                        </tr>
                        <tr>
                            <th>Thể loại</th>
                            <td><%= tailieu.getTheloai() %></td>
                        </tr>
                        <tr>
                            <th>Tác giả</th>
                            <td>
                                <%
                                    for (String tenTacgia : tenTacgiaList) {
                                        out.print(tenTacgia + "<br>");
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <th>Nhà xuất bản</th>
                            <td><%= tailieu.getTblNhaxuatban447id() %></td>
                        </tr>
                        <tr>
                            <th>Năm xuất bản</th>
                            <td><%= tailieu.getNamXuatBan() %></td>
                        </tr>
                        <tr>
                            <th>Ngôn ngữ</th>
                            <td><%= tailieu.getNgonNgu() %></td>
                        </tr>
                        <tr>
                            <th>Số trang</th>
                            <td><%= tailieu.getSoTrang() %></td>
                        </tr>
                    </table>
                </div>
                <div class="form-container">
                    <form action="xacNhanMuon.jsp" method="post" onsubmit="return checkTailieu()">
                        <input type="hidden" name="maTL" value="<%= tailieu.getMaTL() %>">
                        <label for="ngayTraDuKien">Ngày trả dự kiến:</label>
                        <input type="date" id="ngayTraDuKien" name="ngayTraDuKien" required>
                        <div class="button-container">
                            <button type="submit">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        <% } %>
        <% if (notFound) { %>
            <p class="error-message">Không tìm thấy tài liệu</p>
        <% } %>
        <div class="back-link-container">
            <a href="gdQuanlyMuonTL447.jsp" class="back-link">Quay lại</a>
        </div>
    </div>

</body>
</html>