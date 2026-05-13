<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Análisis de Rentabilidad</title>
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
                <div class="card-header bg-white text-warning">
                    <h3 class="mb-0">Captura de Datos: Rentabilidad</h3>
                </div>
                <div class="card-body">
                    <form action="ProcesarRentabilidad" method="POST">
                        <div class="row g-3">
                            <div class="col-md-4"><label class="form-label">Ventas Totales</label><input type="number" step="0.01" name="ventas" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Utilidad Bruta</label><input type="number" step="0.01" name="uBruta" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Utilidad Operativa</label><input type="number" step="0.01" name="uOp" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Utilidad Neta</label><input type="number" step="0.01" name="uNeta" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Activo Total</label><input type="number" step="0.01" name="aTotal" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Capital Contribuido</label><input type="number" step="0.01" name="cContribuido" class="form-control" required></div>
                            <div class="col-md-4"><label class="form-label">Capital Contable</label><input type="number" step="0.01" name="cContable" class="form-control" required></div>
                            <div class="col-12 mt-4 text-center"><button type="submit" class="btn btn-warning px-5">Analizar Rentabilidad</button></div>
                        </div>
                    </form>
                </div>
            </div>
            <% if (request.getAttribute("mb") != null) {%>
            <div class="mt-5 card shadow p-4 border-0">
                <table class="table">
                    <thead><tr><th>Ratio</th><th>Resultado</th><th>Condición</th></tr></thead>
                    <tbody>
                        <tr><td>Margen Bruto</td><td><%= String.format("%.2f%%", (Double) request.getAttribute("mb") * 100)%></td><td class="<%= request.getAttribute("cMb").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cMb")%></td></tr>
                        <tr><td>Margen Operativo</td><td><%= String.format("%.2f%%", (Double) request.getAttribute("mo") * 100)%></td><td class="<%= request.getAttribute("cMo").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cMo")%></td></tr>
                        <tr><td>Margen Neto</td><td><%= String.format("%.2f%%", (Double) request.getAttribute("mn") * 100)%></td><td class="<%= request.getAttribute("cMn").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cMn")%></td></tr>
                        <tr><td>ROA</td><td><%= String.format("%.2f%%", (Double) request.getAttribute("roa") * 100)%></td><td class="<%= request.getAttribute("cRoa").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRoa")%></td></tr>
                        <tr><td>ROCE</td><td><%= String.format("%.2f%%", (Double) request.getAttribute("roce") * 100)%></td><td class="<%= request.getAttribute("cRoce").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRoce")%></td></tr>
                        <tr><td>ROE</td><td><%= String.format("%.2f%%", (Double) request.getAttribute("roe") * 100)%></td><td class="<%= request.getAttribute("cRoe").toString().contains("Cumple") ? "text-success" : "text-danger"%>"><%= request.getAttribute("cRoe")%></td></tr>
                    </tbody>
                </table>
            </div>
            <% }%>
        </div>
    </body>
</html>