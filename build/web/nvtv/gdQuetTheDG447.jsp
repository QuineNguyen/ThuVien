<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Nhanvienthuvien447"%>
<%@page import="model.Thethuvien447"%>
<%@page import="dao.ThethuvienDAO447"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    Nhanvienthuvien447 nhanvien = (Nhanvienthuvien447)session.getAttribute("Nhan vien");
    if(nhanvien == null){
        response.sendRedirect("/PTTK/gdDangnhap447.jsp?err=timeout");
        return;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String formattedDate = sdf.format(nhanvien.getNgaysinh());

    String maDocgia = request.getParameter("maDocgia");
    Thethuvien447 thethuvien = null;
    boolean notFound = false;
    if (maDocgia != null && !maDocgia.isEmpty()) {
        ThethuvienDAO447 thethuvienDAO = new ThethuvienDAO447();
        thethuvien = thethuvienDAO.getThethuvienByMaDocgia(maDocgia);
        if (thethuvien != null) {
            session.setAttribute("Thethuvien", thethuvien);
        } else {
            notFound = true;
        }
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        thethuvien = (Thethuvien447)session.getAttribute("Thethuvien");
        if (thethuvien == null) {
            response.sendRedirect("gdQuetTheDG447.jsp?err=notfound");
            return;
        } else {
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
    <title>Quét thẻ độc giả</title>
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
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 600px;
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
            border: 2px solid #333;
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
            background-color: #ff3d3d;
            color: white;
            font-size: 16px;
            border: 2px solid #333;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #e53935;
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
            margin: 10px 0;
            width: 120px;
        }

        button:hover {
            background-color: #e53935;
        }

        .back-button-container {
            display: flex;
            justify-content: center; /* Căn giữa nút Quay lại */
            margin-top: 20px;
        }

        .back-button {
            background-color: #d3d3d3; /* Màu xám nhạt */
            color: #333;
        }

        .back-button:hover {
            background-color: #b0b0b0; /* Màu xám đậm hơn khi hover */
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
                alert("Chưa có thông tin độc giả");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <div class="container">
        <img src="/PTTK/img/logo.png" alt="Logo" style="width: 100px"> <!-- Add logo -->
        <h1>Tìm kiếm độc giả</h1>
        <div class="search-container">
            <form action="gdQuetTheDG447.jsp" method="get" style="display: flex; align-items: center;">
                <input type="text" name="maDocgia" placeholder="Nhập mã độc giả" value="<%= request.getParameter("maDocgia") != null ? request.getParameter("maDocgia") : "" %>" required>
                <input type="submit" value="Tìm kiếm">
            </form>
        </div>
        <% if (thethuvien != null) { %>
            <div id="docgia-info" class="thethuvien-info">
                <h3>Thông tin thẻ độc giả</h3>
                <img src="/PTTK/img/<%= thethuvien.getAnhthe() %>" alt="Ảnh thẻ" style="max-width: 100px; max-height: 100px;">
                <p><strong>Mã độc giả:</strong> <%= thethuvien.getMadocgia() %></p>
                <p><strong>Tên:</strong> <%= thethuvien.getHoten() %></p>
                <p><strong>Ngày đăng ký:</strong> <%= sdf.format(thethuvien.getNgaydangky()) %></p>
            </div>
        <% } %>
        <% if (notFound) { %>
            <p class="error-message">Không tìm thấy thẻ độc giả</p>
        <% } %>
        <form action="gdQuetTheDG447.jsp" method="post" onsubmit="return checkDocgia()">
            <input type="hidden" name="madocgia" value="<%= maDocgia %>">
            <button type="submit">Xác nhận</button>
        </form>
        <div class="back-link-container">
            <button class="back-button" onclick="window.location.href='gdQuanlyMuonTL447.jsp'">Quay lại</button>
        </div>
    </div>

</body>
</html>