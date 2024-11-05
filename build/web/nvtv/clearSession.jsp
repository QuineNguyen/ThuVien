<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("Thethuvien");
    session.removeAttribute("danhSachMuon");
    response.setStatus(HttpServletResponse.SC_OK);
%>