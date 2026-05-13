package controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProcesarLiquidez", urlPatterns = {"/ProcesarLiquidez"})
public class ProcesarLiquidez extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Recibir datos del JSP
        double ac = Double.parseDouble(request.getParameter("activos"));
        double inventario = Double.parseDouble(request.getParameter("inventario"));
        double pcp = Double.parseDouble(request.getParameter("pasivo"));

        // 2. Procesar Fórmulas 
        double cnt = ac - pcp;                 // Capital Neto de Trabajo
        double rc = ac / pcp;                  // Razon Circulante
        double pa = (ac - inventario) / pcp;   // Prueba Ácida

        // 3. Evaluar Condiciones [cite: 8]
        String condCnt = (cnt > 50000) ? "Cumple (Mayor a $50,000)" : "No cumple";
        String condRc = (rc > 2) ? "Cumple (Mayor a 2)" : "No cumple";
        String condPa = (pa > 1) ? "Cumple (Mayor a 1)" : "No cumple";

        // 4. Enviar resultados de vuelta al JSP
        request.setAttribute("cnt", cnt);
        request.setAttribute("rc", rc);
        request.setAttribute("pa", pa);
        request.setAttribute("condCnt", condCnt);
        request.setAttribute("condRc", condRc);
        request.setAttribute("condPa", condPa);

        request.getRequestDispatcher("liquidez.jsp").forward(request, response);
    }
}