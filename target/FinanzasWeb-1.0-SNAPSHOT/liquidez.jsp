<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Análisis de Liquidez</title>
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
                        <div class="card-header bg-white text-primary">
                            <h3 class="mb-0">Análisis de Liquidez</h3>
                        </div>
                        <div class="card-body">
                            <form action="ProcesarLiquidez" method="POST">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Activos Circulantes (AC)</label>
                                        <input type="number" step="0.01" name="activos" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Inventario</label>
                                        <input type="number" step="0.01" name="inventario" class="form-control" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="form-label">Pasivos a Corto Plazo (PCP)</label>
                                        <input type="number" step="0.01" name="pasivo" class="form-control" required>
                                    </div>
                                    <div class="col-12 mt-4 text-center">
                                        <button type="submit" class="btn btn-primary px-5">Calcular Indicadores</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <% if (request.getAttribute("cnt") != null) {%>
                    <div class="mt-5 card shadow p-4 border-0">
                        <h4 class="text-secondary mb-4">Resultados Obtenidos:</h4>
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>Indicador</th>
                                    <th>Resultado</th>
                                    <th>Condición</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Capital Neto de Trabajo (CNT)</td>
                                    <td>$<%= request.getAttribute("cnt")%></td>
                                    <td class="<%= request.getAttribute("condCnt").toString().contains("Cumple") ? "text-success" : "text-danger"%>">
                                        <%= request.getAttribute("condCnt")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Razón Circulante (RC)</td>
                                    <td><%= String.format("%.2f", (Double) request.getAttribute("rc"))%></td>
                                    <td class="<%= request.getAttribute("condRc").toString().contains("Cumple") ? "text-success" : "text-danger"%>">
                                        <%= request.getAttribute("condRc")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Prueba Ácida (PA)</td>
                                    <td><%= String.format("%.2f", (Double) request.getAttribute("pa"))%></td>
                                    <td class="<%= request.getAttribute("condPa").toString().contains("Cumple") ? "text-success" : "text-danger"%>">
                                        <%= request.getAttribute("condPa")%>
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