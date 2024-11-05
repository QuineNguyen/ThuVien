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
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
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

        button {
            font-size: 16px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 20px 5px 5px 5px;
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
    </style>
</head>
<body>

    <div class="container">
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
        <button onclick="window.location.href='gdTimkiemtailieu447.jsp'">Tìm kiếm tài liệu</button>
        <div class="back-link-container">
            <a href="/PTTK/gdDangnhap447.jsp" class="back-link">Đăng xuất</a>
        </div>
    </div>

</body>
</html>
