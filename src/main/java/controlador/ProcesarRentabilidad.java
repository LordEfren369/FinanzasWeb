package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProcesarRentabilidad", urlPatterns = {"/ProcesarRentabilidad"})
public class ProcesarRentabilidad extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Entradas
        double ventas = Double.parseDouble(request.getParameter("ventas"));
        double uBruta = Double.parseDouble(request.getParameter("uBruta"));
        double uOp = Double.parseDouble(request.getParameter("uOp"));
        double uNeta = Double.parseDouble(request.getParameter("uNeta"));
        double aTotal = Double.parseDouble(request.getParameter("aTotal"));
        double cContribuido = Double.parseDouble(request.getParameter("cContribuido"));
        double cContable = Double.parseDouble(request.getParameter("cContable"));

        // Procesos 
        double mb = uBruta / ventas;
        double mo = uOp / ventas;
        double mn = uNeta / ventas;
        double roa = uNeta / aTotal;
        double roce = uNeta / cContribuido;
        double roe = uNeta / cContable;

        // Condiciones 
        request.setAttribute("mb", mb);
        request.setAttribute("cMb", (mb > 0.50) ? "Cumple (> 50%)" : "No cumple");
        request.setAttribute("mo", mo);
        request.setAttribute("cMo", (mo > 0.20) ? "Cumple (> 20%)" : "No cumple");
        request.setAttribute("mn", mn);
        request.setAttribute("cMn", (mn > 0.10) ? "Cumple (> 10%)" : "No cumple");
        request.setAttribute("roa", roa);
        request.setAttribute("cRoa", (roa > 0.15) ? "Cumple (> 15%)" : "No cumple");
        request.setAttribute("roce", roce);
        request.setAttribute("cRoce", (roce > 0.35) ? "Cumple (> 35%)" : "No cumple");
        request.setAttribute("roe", roe);
        request.setAttribute("cRoe", (roe > 0.50) ? "Cumple (> 50%)" : "No cumple");

        request.getRequestDispatcher("rentabilidad.jsp").forward(request, response);
    }
}