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
            background-color: #f4f4f9;
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
            margin: 10px 0;
            width: 120px;
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
        <h1>Quét thẻ độc giả</h1>
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
        <form action="xacNhan.jsp" method="post" onsubmit="return checkDocgia()">
            <input type="hidden" name="madocgia" value="<%= maDocgia %>">
            <button type="submit">Xác nhận</button>
        </form>
        <div class="back-link-container">
            <a href="gdQuanlyMuonTL447.jsp" class="back-link">Quay lại</a>
        </div>
    </div>

</body>
</html>