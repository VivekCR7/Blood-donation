package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class select_005fcamp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/csscript.jsp");
    _jspx_dependants.add("/main_nav.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Select Camp</title>\n");
      out.write("        ");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\n");
      out.write("\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" \n");
      out.write("      integrity=\"sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("<link rel=\"canonical\" href=\"https://getbootstrap.com/docs/5.0/examples/carousel/\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js\"\n");
      out.write("integrity=\"sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <style>\n");
      out.write("        .bg-custom-1 {\n");
      out.write("            background-color: #85144b;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .bg-custom-2 {\n");
      out.write("            background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    \n");
      out.write("    ");

    String eemail = request.getParameter("email");
    
      out.write("\n");
      out.write("    \n");
      out.write("<nav class=\"navbar navbar-dark bg-dark navbar-expand-sm\" style=\"height:55px;\">\n");
      out.write("    <a class=\"navbar-brand\" href=\"#\" style=\"margin-left:70px;\">\n");
      out.write("        <img src=\"https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/logo_white.png\" width=\"30\" height=\"30\" alt=\"logo\">\n");
      out.write("        DONOR\n");
      out.write("    </a>\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-list-4\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("        <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("    </button>\n");
      out.write("    <div class=\"collapse navbar-collapse \" id=\"navbar-list-4\" >\n");
      out.write("        <ul class=\"navbar-nav ms-auto\" style=\"margin-right:70px;\">\n");
      out.write("            <li class=\"nav-item dropdown \" >\n");
      out.write("                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdownMenuLink\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                    <img src=\"https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg\" width=\"40\" height=\"40\" class=\"rounded-circle\">\n");
      out.write("                </a>\n");
      out.write("                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\n");
      out.write("                    <a class=\"dropdown-item\" href=\"dnr_edit.jsp?email=");
      out.print(eemail);
      out.write("\">Edit Profile</a>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"dnr_reset.jsp?email=");
      out.print(eemail);
      out.write("\">Reset Password</a>\n");
      out.write("                    <a class=\"dropdown-item\" href=\"dnr_logout\">Log Out</a>\n");
      out.write("                </div>\n");
      out.write("            </li>   \n");
      out.write("        </ul>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("<!-- Required Js -->\n");
      out.write("        <script src=\"./assets/js/vendor-all.min.js\"></script>\n");
      out.write("        <script src=\"./assets/plugins/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

            if (session.getAttribute("email") == null) {
                response.sendRedirect("Donor_signin.jsp");
            }
        
      out.write("\n");
      out.write("        ");

            int id = 0;
            String did = request.getParameter("did");
            String cid = request.getParameter("cid");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bds", "root", "");
                PreparedStatement ps = null;
                ps = con.prepareStatement("SELECT camp.cname, camp.address, state.state_name, city.city_name, camp.pincode, camp.email, camp.phone, camp.start_date, camp.end_date FROM camp inner join state on camp.state_id=state.state_id inner join city on camp.city_id=city.city_id where id = '" + cid + "'");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        
      out.write("\n");
      out.write("        <div class=\"col-xl-12 col-xl-6 container\" style=\"margin-top: 10px;\">\n");
      out.write("            <div class=\"card table-card\">\n");
      out.write("                <div class=\"card-header\">\n");
      out.write("                    <h5>Add Camp Details</h5>\n");
      out.write("                </div>\n");
      out.write("                <form method=\"get\" action=\"camp_insert\">\n");
      out.write("                    <div class=\"card-body px-0 py-0\">\n");
      out.write("                        <div class=\"table-responsive\">\n");
      out.write("                            <div class=\"session-scroll\" style=\"position:relative;\">\n");
      out.write("                                <table class=\"table table-hover m-b-0\">\n");
      out.write("                                    <thead>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th colspan=\"3\" class=\"bg-primary text-white\">Camp Name</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </thead>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td colspan=\"3\"><h5>Camp Name:</h5> <input class=\"form-control\" disabled=\"\" type=\"text\" value=\"");
      out.print(rs.getString(1));
      out.write("\" name=\"cname\"></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <thead>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th colspan=\"3\"class=\"bg-primary text-white\">Address</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </thead>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td colspan=\"3\"><h5>Address:</h5> <input class=\"form-control\" disabled=\"\" type=\"text\" value=\"");
      out.print(rs.getString(2));
      out.write("\" name=\"address\"></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>\n");
      out.write("                                            <h5>State:</h5> <input class=\"form-control\" disabled=\"\" type=\"text\" value=\"");
      out.print(rs.getString(3));
      out.write("\" name=\"state\">\n");
      out.write("                                        </td>\n");
      out.write("                                        <td>\n");
      out.write("                                            <h5>City:</h5> <input class=\"form-control\" disabled=\"\" type=\"text\" value=\"");
      out.print(rs.getString(4));
      out.write("\" name=\"address\">\n");
      out.write("                                        </td>\n");
      out.write("                                        <td><h5>Pin code:</h5> <input class=\"form-control\" type=\"text\" disabled=\"\" value=\"");
      out.print(rs.getString(5));
      out.write("\" name=\"pincode\"></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <thead>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <th colspan=\"3\" class=\"bg-primary text-white\">Contact Details</th>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </thead>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td colspan=\"2\"><h5>Email:</h5> <input class=\"form-control\" value=\"");
      out.print(rs.getString(6));
      out.write("\" disabled=\"\" type=\"text\" placeholder=\"Email\" value=\"\"  name=\"email\"></td>\n");
      out.write("                                        <td><h5>Phone:</h5> <input class=\"form-control\" type=\"text\" disabled=\"\" value=\"");
      out.print(rs.getString(7));
      out.write("\" name=\"phone\"></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td><h5>Start Date:</h5> <input class=\"form-control\" disabled=\"\" type=\"date\" value=\"");
      out.print(rs.getString(8));
      out.write("\"  name=\"sdt\"></td>\n");
      out.write("                                        <td><h5>End Date:</h5> <input class=\"form-control\" disabled=\"\" type=\"date\" value=\"");
      out.print(rs.getString(9));
      out.write("\"  name=\"edt\"></td>\n");
      out.write("                                    </tr>\n");
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td colspan=\"3\"><a href=\"#\"><input type=\"button\" data-toggle=\"modal\" data-target=\"#myModal1\" value=\"Select This Camp\" class=\"btn btn-success\"></a> \n");
      out.write("                                            <a href=\"dnr_fpage.jsp\"><input type=\"button\" value=\"Cancel\" class=\"btn btn-danger\"></a></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    <!-- Modal -->\n");
      out.write("                                    <div class=\"modal\" id=\"myModal1\" tabindex=\"-1\">\n");
      out.write("                                        <div class=\"modal-dialog\">\n");
      out.write("                                            <div class=\"modal-content\">\n");
      out.write("                                                <div class=\"modal-header\">\n");
      out.write("                                                    <h5 class=\"modal-title\">Update</h5>\n");
      out.write("                                                    <a href=\"#\" class=\"btn-close\" data-dismiss=\"modal\" aria-label=\"close\"></a>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"modal-body\">\n");
      out.write("                                                    <p>Are you sure you want to select this camp?</p>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"modal-footer\">\n");
      out.write("                                                    <a href=\"#\"><input type=\"submit\" value=\"Yes\" class=\"btn btn-primary\"></a>\n");
      out.write("                                                    <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">No</button>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </table>\n");
      out.write("                            </div>\n");
      out.write("                        </div>      \n");
      out.write("                    </div>  \n");
      out.write("                </form>        \n");
      out.write("            </div>              \n");
      out.write("        </div>\n");
      out.write("        ");

                }
            } catch (Exception e) {
                System.out.print(e);
                out.print("error");
                //response.sendRedirect("a_dnr_details.jsp?msg=exception");
            }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
