<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Análisis de Eficiencia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark mb-4">
            <div class="container">
                <a class="btn btn-outline-light" href="index.jsp">Menú Principal</a>
            </div>
        </nav>
        <div class="container pb-5">
            <div class="card shadow">
                <div class="card-header bg-white text-info"><h3 class="mb-0">Eficiencia Operativa</h3></div>
                <div class="card-body">
                    <form action="ProcesarEficiencia" method="POST">
                        <div class="row g-3">
                            <div class="col-md-4"><label class="form-label">Costo de Ventas</label><input type="number" step="0.01" name="costoVentas" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Inventarios</label><input type="number" step="0.01" name="inventarios" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Ventas al Crédito</label><input type="number" step="0.01" name="ventasCredito" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Cuentas por Cobrar</label><input type="number" step="0.01" name="cxc" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Compras al Crédito</label><input type="number" step="0.01" name="comprasCredito" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Cuentas por Pago</label><input type="number" step="0.01" name="cxp" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Ventas Totales</label><input type="number" step="0.01" name="ventasTotales" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Activos Totales</label><input type="number" step="0.01" name="activosTotales" class="form-control" required></div>
                            <div class="col-12 mt-4 text-center"><button type="submit" class="btn btn-info text-white px-5">Analizar Eficiencia</button></div>
                        </div>
                    </form>
                </div>
            </div>
            <% if (request.getAttribute("ri") != null) {%>
            <div class="mt-5 card shadow p-4 border-0">
                <table class="table">
                    <thead><tr><th>Indicador</th><th>Resultado</th><th>Condición</th></tr></thead>
                    <tbody>
                        <tr><td>Rotación Inventario</td><td><%= String.format("%.2f veces", (Double) request.getAttribute("ri"))%></td><td class="<%= request.getAttribute("cRi").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRi")%></td></tr>
                        <tr><td>Plazo Prom. Inventario</td><td><%= String.format("%.2f días", (Double) request.getAttribute("ppi"))%></td><td class="<%= request.getAttribute("cPpi").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cPpi")%></td></tr>
                        <tr><td>Rotación Cuentas Cobrar</td><td><%= String.format("%.2f veces", (Double) request.getAttribute("rcxc"))%></td><td class="<%= request.getAttribute("cRcxc").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRcxc")%></td></tr>
                        <tr><td>Plazo Prom. Cobro</td><td><%= String.format("%.2f días", (Double) request.getAttribute("ppc"))%></td><td class="<%= request.getAttribute("cPpc").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cPpc")%></td></tr>
                        <tr><td>Rotación Cuentas Pago</td><td><%= String.format("%.2f veces", (Double) request.getAttribute("rcxp"))%></td><td class="<%= request.getAttribute("cRcxp").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRcxp")%></td></tr>
                        <tr><td>Ciclo Operativo</td><td><%= String.format("%.2f días", (Double) request.getAttribute("co"))%></td><td class="<%= request.getAttribute("cCo").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cCo")%></td></tr>
                        <tr><td>Rotación Activo Total</td><td><%= String.format("%.2f veces", (Double) request.getAttribute("rat"))%></td><td class="<%= request.getAttribute("cRat").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRat")%></td></tr>
                    </tbody>
                </table>
            </div>
            <% }%>
        </div>
    </body>
</html>