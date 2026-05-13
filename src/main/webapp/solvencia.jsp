<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Análisis de Solvencia</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark mb-4">
            <div class="container">
                <a class="btn btn-outline-light" href="index.jsp">Menú Principal</a>
            </div>
        </nav>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow">
                        <div class="card-header bg-white text-success">
                            <h3 class="mb-0">Análisis de Solvencia</h3>
                        </div>
                        <div class="card-body">
                            <form action="ProcesarSolvencia" method="POST">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Activo Total (AT)</label>
                                        <input type="number" step="0.01" name="at" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Pasivo Total (PT)</label>
                                        <input type="number" step="0.01" name="pt" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Utilidad Operativa</label>
                                        <input type="number" step="0.01" name="utilOp" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Gastos por Interés</label>
                                        <input type="number" step="0.01" name="interes" class="form-control" required>
                                    </div>
                                    <div class="col-12 mt-4 text-center">
                                        <button type="submit" class="btn btn-success px-5">Calcular Solvencia</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <% if (request.getAttribute("apalancamiento") != null) {%>
                    <div class="mt-5 card shadow p-4 border-0">
                        <h4 class="text-secondary mb-4">Resultados:</h4>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Indicador</th>
                                    <th>Resultado</th>
                                    <th>Condición</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Apalancamiento</td>
                                    <td><%= String.format("%.2f%%", (Double) request.getAttribute("apalancamiento") * 100)%></td>
                                    <td class="<%= request.getAttribute("condApa").toString().contains("Cumple") ? "text-success" : "text-danger"%>">
                                        <%= request.getAttribute("condApa")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cobertura de Interés (CI)</td>
                                    <td><%= String.format("%.2f", (Double) request.getAttribute("ci"))%></td>
                                    <td class="<%= request.getAttribute("condCi").toString().contains("Cumple") ? "text-success" : "text-danger"%>">
                                        <%= request.getAttribute("condCi")%>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>