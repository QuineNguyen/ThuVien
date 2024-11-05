<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Nguoidung447"%>
<%@page import="model.Docgia447"%>
<%@page import="model.Nhanvienthuvien447"%>
<%@page import="dao.NguoidungDAO447"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Thư viện</title>
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

        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 24px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center; /* Căn giữa các phần tử con theo chiều ngang */
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
            align-self: flex-start; /* Căn lề trái cho các nhãn */
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            width: 100%; /* Đặt chiều rộng của các ô nhập liệu */
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 120px;
            text-align: center; /* Căn giữa văn bản bên trong nút */
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <img src="" alt="">
        <h2>Chào mừng đến với thư viện PTIT</h2>
        <form action="gdDangnhap447.jsp" method="post">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="tendangnhap" placeholder="Nhập tên đăng nhập" required>

            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="matkhau" placeholder="Nhập mật khẩu" required>

            <input type="submit" value="Đăng nhập">
        </form>

        <%
        String tendangnhap = request.getParameter("tendangnhap");
        String matkhau = request.getParameter("matkhau");

        if (tendangnhap != null && matkhau != null) {
            NguoidungDAO447 ndDAO = new NguoidungDAO447();
            Nguoidung447 nd = ndDAO.xacthuc(tendangnhap, matkhau);
            if (nd != null) {
                if ("Doc gia".equals(nd.getVaitro())) {
                    Docgia447 docgia = new Docgia447(
                        nd.getId(),
                        nd.getTendangnhap(),
                        nd.getMatkhau(),
                        nd.getHoten(),
                        nd.getNgaysinh(),
                        nd.isGioitinh(),
                        nd.getEmail(),
                        nd.getSodienthoai(),
                        nd.getDiachi(),
                        nd.getVaitro(),
                        nd.getId()
                    );
                    session.setAttribute("Doc gia", docgia);
                    response.sendRedirect("dg/gdChinhDG447.jsp");
                } else if ("Nhan vien".equals(nd.getVaitro())) {
                    Nhanvienthuvien447 nhanvienthuvien = new Nhanvienthuvien447(
                        nd.getId(),
                        nd.getTendangnhap(),
                        nd.getMatkhau(),
                        nd.getHoten(),
                        nd.getNgaysinh(),
                        nd.isGioitinh(),
                        nd.getEmail(),
                        nd.getSodienthoai(),
                        nd.getDiachi(),
                        nd.getVaitro(),
                        "Vị trí mặc định", // Thay thế bằng giá trị thực tế nếu có
                        nd.getId(), // tblNguoidung447Id
                        1, // tblThuvien447id, thay thế bằng giá trị thực tế nếu có
                        nd.getId() // tblNhanvien447id
                    );
                    session.setAttribute("Nhan vien", nhanvienthuvien);
                    response.sendRedirect("nvtv/gdChinhNV447.jsp");
                }
            } else {
                out.println("<p class='error-message'>Tên đăng nhập hoặc mật khẩu không đúng!</p>");
            }
        }
        %>
    </div>

</body>
</html>
