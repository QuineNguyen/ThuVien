<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DocgiaDAO447"%>
<%@page import="model.Docgia447"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    Docgia447 docgia = (Docgia447)session.getAttribute("Doc gia");
    if(docgia == null){
        response.sendRedirect("/PTTK/gdDangnhap447.jsp?err=timeout");
        return;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String formattedDate = sdf.format(docgia.getNgaysinh());
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ độc giả</title>
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
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #ff3d3d;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
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
            margin: 20px 5px 5px 5px;
        }

        button:hover {
            background-color: #e53935;
        }

        .logout-button {
            background-color: #d3d3d3; /* Màu xám nhạt */
            color: #333;
        }

        .logout-button:hover {
            background-color: #b0b0b0; /* Màu xám đậm hơn khi hover */
        }
    </style>
</head>
<body>

    <div class="container">
        <img src="/PTTK/img/logo.png" alt="Logo" style="width: 150px"> <!-- Add logo -->
        <h1>Chào mừng, <%= docgia.getHoten() %>!</h1>
        <div class="table-container">
            <table>
                <tr>
                    <th>Mã độc giả</th>
                    <td><%= docgia.getMadocgia() %></td>
                </tr>
                <tr>
                    <th>Họ tên</th>
                    <td><%= docgia.getHoten() %></td>
                </tr>
                <tr>
                    <th>Ngày sinh</th>
                    <td><%= formattedDate %></td>
                </tr>
                <tr>
                    <th>Giới tính</th>
                    <td><%= docgia.isGioitinh() ? "Nam" : "Nữ" %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= docgia.getEmail() %></td>
                </tr>
                <tr>
                    <th>Số điện thoại</th>
                    <td><%= docgia.getSodienthoai() %></td>
                </tr>
                <tr>
                    <th>Địa chỉ</th>
                    <td><%= docgia.getDiachi() %></td>
                </tr>
            </table>
        </div>
        <div class="button-container">
            <button onclick="window.location.href='gdTimkiemtailieu447.jsp'">Tìm kiếm tài liệu</button>
            <button class="logout-button" onclick="window.location.href='/PTTK/gdDangnhap447.jsp'">Đăng xuất</button>
        </div>
    </div>

</body>
</html>
