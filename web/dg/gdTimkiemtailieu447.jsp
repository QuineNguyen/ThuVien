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
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .search-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 800px;
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
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f9;
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

    <div class="search-container">
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
        <div class="back-link-container">
            <a href="gdChinhDG447.jsp" class="back-link">Quay lại</a>
        </div>
    </div>

</body>
</html>
