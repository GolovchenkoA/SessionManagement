package ua.golovchenko.artem.controller;

/**
 * Created by art on 10.04.2016.
 */
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final String userID = "admin";
    private final String password = "admin";

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        // get request parameters for userID and password
        String user = request.getParameter("user");
        String pwd = request.getParameter("pwd");

        if(userID.equals(user) && password.equals(pwd)){
            HttpSession session = request.getSession();
            session.setAttribute("user","Artem");
            session.setMaxInactiveInterval(30*60); //max session 30 min
            Cookie loginCookie = new Cookie("user",user);
            loginCookie.setMaxAge(30*60); //setting cookie to expiry in 30 mins
            response.addCookie(loginCookie);
            /*response.sendRedirect("LoginSuccess.jsp");*/
            String encodedURL = response.encodeRedirectURL("LoginSuccess.jsp");
            response.sendRedirect(encodedURL);
        }else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out= response.getWriter();
            out.println("<font color=red>Either user name or password is wrong.</font>");
            rd.include(request, response);
        }

    }

}