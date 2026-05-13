package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProcesarEficiencia", urlPatterns = {"/ProcesarEficiencia"})
public class ProcesarEficiencia extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        double cv = Double.parseDouble(request.getParameter("costoVentas"));
        double inv = Double.parseDouble(request.getParameter("inventarios"));
        double vc = Double.parseDouble(request.getParameter("ventasCredito"));
        double cxc = Double.parseDouble(request.getParameter("cxc"));
        double cc = Double.parseDouble(request.getParameter("comprasCredito"));
        double cxp = Double.parseDouble(request.getParameter("cxp"));
        double vt = Double.parseDouble(request.getParameter("ventasTotales"));
        double at = Double.parseDouble(request.getParameter("activosTotales"));

        // Cálculos 
        double ri = cv / inv;
        double ppi = 360 / ri;
        double rcxc = vc / cxc;
        double ppc = 360 / rcxc;
        double rcxp = cc / cxp;
        double ppp = 360 / rcxp;
        double co = ppi + ppc;
        double ce = co - ppp;
        double rat = vt / at;

        // Atributos para el JSP con sus condiciones 
        request.setAttribute("ri", ri);
        request.setAttribute("cRi", (ri > 12) ? "Cumple (> 12 veces)" : "No cumple");
        request.setAttribute("ppi", ppi);
        request.setAttribute("cPpi", (ppi < 30) ? "Cumple (< 30 días)" : "No cumple");
        request.setAttribute("rcxc", rcxc);
        request.setAttribute("cRcxc", (rcxc > 6) ? "Cumple (> 6 veces)" : "No cumple");
        request.setAttribute("ppc", ppc);
        request.setAttribute("cPpc", (ppc < 60) ? "Cumple (< 60 días)" : "No cumple");
        request.setAttribute("rcxp", rcxp);
        request.setAttribute("cRcxp", (rcxp < 12) ? "Cumple (< 12 veces)" : "No cumple");
        request.setAttribute("ppp", ppp);
        request.setAttribute("cPpp", (ppp > 30) ? "Cumple (> 30 días)" : "No cumple");
        request.setAttribute("co", co);
        request.setAttribute("cCo", (co < 90) ? "Cumple (< 90 días)" : "No cumple");
        request.setAttribute("ce", ce);
        request.setAttribute("cCe", (ce < 60) ? "Cumple (< 60 días)" : "No cumple");
        request.setAttribute("rat", rat);
        request.setAttribute("cRat", (rat > 2) ? "Cumple (> 2 veces)" : "No cumple");

        request.getRequestDispatcher("eficiencia.jsp").forward(request, response);
    }
}