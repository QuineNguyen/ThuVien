<%@ page import="dao.TailieuDAO447, model.Tailieu447" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Lấy thông tin tài liệu từ DAO (có thể nhận id từ query string hoặc form gửi về)
    String idString = request.getParameter("id");
    String tenTimkiem = request.getParameter("tenTimkiem");
    int id = -1;
    if (idString != null) {
        try {
            id = Integer.parseInt(idString); // Chuyển chuỗi id thành số
        } catch (NumberFormatException e) {
            id = -1; // Nếu chuyển đổi thất bại, đặt id thành -1
        }
    }

    TailieuDAO447 dao = new TailieuDAO447();
    Tailieu447 tailieu = dao.getTailieuTheoMa(id);

    // Lấy danh sách tên tác giả
    List<String> tenTacgiaList = new ArrayList<>();
    if (tailieu != null) {
        try {
            Connection conn = dao.getConnection();
            String sqlTacgia = "SELECT tg.ten " +
                               "FROM tblTacgia447 tg " +
                               "JOIN tblTacgiaTailieu447 tgtl ON tg.id = tgtl.tblTacgia447id " +
                               "WHERE tgtl.tblTailieu447id = ?";
            PreparedStatement stmtTacgia = conn.prepareStatement(sqlTacgia);
            stmtTacgia.setInt(1, id);
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
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết tài liệu</title>
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
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            max-height: 100vh;
            overflow-y: auto;
        }

        h1 {
            text-align: center;
            color: #333;
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
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back-button-container {
            display: flex;
            justify-content: center; /* Căn giữa nút Quay lại */
            margin-top: 20px;
        }

        .back-button {
            padding: 12px 20px;
            background-color: #d3d3d3; /* Màu xám nhạt */
            color: #333;
            font-size: 16px;
            border: 2px solid #333;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #b0b0b0; /* Màu xám đậm hơn khi hover */
        }
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="search-container">
        <img src="/PTTK/img/logo.png" alt="Logo" style="width: 100px; display: block; margin: 0 auto;"> <!-- Add logo -->
        <h1>Xem chi tiết tài liệu</h1>

        <% if (tailieu != null) { %> <!-- Kiểm tra nếu tailieu không phải là null -->
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
        <% } else { %> <!-- Hiển thị thông báo nếu tailieu là null -->
            <p class="error-message">Không tìm thấy tài liệu với ID được cung cấp.</p>
        <% } %>

        <div class="back-button-container">
            <button class="back-button" onclick="window.location.href='gdTimkiemtailieu447.jsp?tenTimkiem=<%= tenTimkiem %>'">Quay lại danh sách</button>
        </div>
    </div>
</body>
</html>