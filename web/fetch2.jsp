<%--
    Document   : save
    Created on : 15 Feb, 2018, 11:15:40 AM
    Author     : user2
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="msg"></div>
        <select class="form-control" name="city" id="sts">
            <option disabled="">Select City</option>
            <%try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from city where state_id='" + id + "'");
                    while (rs.next()) {
            %>
            <option value="<%=rs.getString("city_id")%>"><%=rs.getString("city_name")%></option>
            <%
                    }
                } catch (Exception e) {
                    System.out.print(e);
                }
            %>
        </select>
    </body>
</html>
