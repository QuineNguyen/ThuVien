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

        .login-container {
            position: relative;
            z-index: 1;
            background-color: #fff;
            padding: 40px 40px 20px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 12px;
            margin: 8px 0;
            border: 2px solid #333;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #ff3d3d; /* Red button color */
            color: #fff;
            padding: 12px;
            border: 2px solid #333;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100px;
        }

        input[type="submit"]:hover {
            background-color: #e53935;
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
        <img src="/PTTK/img/logo.png" alt="Logo" style="width: 150px"> <!-- Add logo -->
        <h2>Chào mừng đến với Thư viện PTIT</h2>
        <form action="gdDangnhap447.jsp" method="post">
            <input type="text" id="username" name="tendangnhap" placeholder="Nhập tên đăng nhập" required>
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
