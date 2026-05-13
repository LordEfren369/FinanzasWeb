<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Análisis Financiero</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .card-custom:hover {
                transform: translateY(-5px);
                transition: all 0.3s ease;
                box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
            }
        </style>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-dark bg-dark shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Calculadora de Finanzas</a>
            </div>
        </nav>

        <div class="container py-5">
            <div class="text-center mb-5">
                <h1 class="display-5 fw-bold text-primary">Panel de Análisis</h1>
                <p class="lead">Elija el análisis que desea realizar</p>
            </div>

            <div class="row g-4 justify-content-center">
                <div class="col-md-5 col-lg-3">
                    <div class="card h-100 shadow-sm card-custom border-0">
                        <div class="card-body text-center p-4">
                            <h4 class="card-title">Liquidez</h4>
                            <a href="liquidez.jsp" class="btn btn-primary w-100 mt-3">Seleccionar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-lg-3">
                    <div class="card h-100 shadow-sm card-custom border-0">
                        <div class="card-body text-center p-4">
                            <h4 class="card-title">Solvencia</h4>
                            <a href="solvencia.jsp" class="btn btn-success w-100 mt-3">Seleccionar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-lg-3">
                    <div class="card h-100 shadow-sm card-custom border-0">
                        <div class="card-body text-center p-4">
                            <h4 class="card-title">Rentabilidad</h4>
                            <a href="rentabilidad.jsp" class="btn btn-warning w-100 mt-3">Seleccionar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-lg-3">
                    <div class="card h-100 shadow-sm card-custom border-0">
                        <div class="card-body text-center p-4">
                            <h4 class="card-title">Eficiencia</h4>
                            <a href="eficiencia.jsp" class="btn btn-info text-white w-100 mt-3">Seleccionar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>