<%@page import="dao.TailieuDAO447"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*" %>
<%@page import="model.Tailieu447"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm tài liệu</title>
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

        .search-container {
            position: relative;
            z-index: 1;
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            width: 100%;
            max-height: 100vh;
            overflow-y: auto; /* Giới hạn cuộn cho toàn bộ container */
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
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

        input[type="submit"], .back-button {
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

        .table-container {
            max-height: 400px; /* Giới hạn chiều cao của phần kết quả */
            overflow-y: auto; /* Kích hoạt thanh cuộn dọc nếu vượt quá chiều cao */
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 2px solid #333;
            text-align: left;
        }

        th {
            background-color: #ff3d3d;
            text-align: center;
            color: #fff;
        }

        th:first-child, td:first-child, th:nth-child(4), th:nth-child(5), td:nth-child(4), td:nth-child(5) {
            text-align: center;
            max-width: 100px;
        }

        .back-button-container {
            display: flex;
            justify-content: center; /* Căn giữa nút Quay lại */
            margin-top: 20px;
        }

        .back-button {
            background-color: #d3d3d3; /* Màu xám nhạt */
            color: #333;
            display: flex;
            justify-content: center;
        }

        .back-button:hover {
            background-color: #b0b0b0; /* Màu xám đậm hơn khi hover */
        }
    </style>
</head>
<body>

    <div class="search-container">
        <img src="/PTTK/img/logo.png" alt="Logo" style="width: 100px; display: block; margin: 0 auto;"> <!-- Add logo -->
        <h1>Tìm kiếm tài liệu</h1>
        <form action="gdTimkiemtailieu447.jsp" method="get">
            <input type="text" name="tenTimkiem" placeholder="Nhập tên tài liệu" value="<%= request.getParameter("tenTimkiem") != null ? request.getParameter("tenTimkiem") : "" %>" required>
            <input type="submit" value="Tìm kiếm">
        </form>

        <%
            String tenTimkiem = request.getParameter("tenTimkiem");
            if (tenTimkiem != null && !tenTimkiem.isEmpty()) {
                TailieuDAO447 tailieuDAO = new TailieuDAO447();
                List<Tailieu447> documents = tailieuDAO.getTLtheoTen(tenTimkiem);

                if (!documents.isEmpty()) {
        %>
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã tài liệu</th>
                                    <th>Tên tài liệu</th>
                                    <th>Nhà xuất bản</th>
                                    <th>Thể loại</th>
                                    <th>Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Tailieu447 document : documents) {
                                        // Thực hiện truy vấn để lấy tên nhà xuất bản
                                        String nhaXuatBan = "";
                                        try {
                                            Connection conn = TailieuDAO447.getConnection();
                                            String sql = "SELECT ten FROM tblNhaxuatban447 WHERE id = ?";
                                            PreparedStatement stmt = conn.prepareStatement(sql);
                                            stmt.setInt(1, document.getTblNhaxuatban447id());
                                            ResultSet rs = stmt.executeQuery();
                                            if (rs.next()) {
                                                nhaXuatBan = rs.getString("ten");
                                            }
                                            rs.close();
                                            stmt.close();
                                            conn.close();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                %>
                                        <tr>
                                            <td><%= document.getMaTL() %></td>
                                            <td><%= document.getTen() %></td>
                                            <td><%= nhaXuatBan %></td>
                                            <td><%= document.getTheloai() %></td>
                                            <td><a href="gdXemchitiettailieu447.jsp?id=<%= document.getId() %>&tenTimkiem=<%= tenTimkiem %>">Xem</a></td>
                                        </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
        <%
                } else {
        %>
                    <p>Không tìm thấy tài liệu nào.</p>
        <%
                }
            }
        %>
        <div class="back-button-container">
            <button class="back-button" onclick="window.location.href='gdChinhDG447.jsp'">Quay lại</button>
        </div>
    </div>

</body>
</html>
