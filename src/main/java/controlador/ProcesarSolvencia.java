package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProcesarSolvencia", urlPatterns = {"/ProcesarSolvencia"})
public class ProcesarSolvencia extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recibir datos
        double at = Double.parseDouble(request.getParameter("at"));
        double pt = Double.parseDouble(request.getParameter("pt"));
        double utilOp = Double.parseDouble(request.getParameter("utilOp"));
        double interes = Double.parseDouble(request.getParameter("interes"));

        // Proceso (Fórmulas del proyecto) 
        double apalancamiento = pt / at;
        double ci = utilOp / interes;

        // Evaluar Condiciones 
        String condApa = (apalancamiento < 0.50) ? "Cumple (Menor al 50%)" : "No cumple";
        String condCi = (ci > 3) ? "Cumple (Mayor que 3)" : "No cumple";

        // Enviar al JSP
        request.setAttribute("apalancamiento", apalancamiento);
        request.setAttribute("ci", ci);
        request.setAttribute("condApa", condApa);
        request.setAttribute("condCi", condCi);

        request.getRequestDispatcher("solvencia.jsp").forward(request, response);
    }
}