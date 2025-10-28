<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Mi Progreso"/>
</jsp:include>

<div class="container mx-auto px-4 sm:px-8 max-w-7xl">
    <h2 class="text-2xl font-semibold text-gray-800 mb-6">Tu Evolución</h2>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 items-start">

        <div class="space-y-6">

            <div class="bg-white p-6 rounded-lg shadow-sm">
                <c:choose>
                    <c:when test="${not empty progresoHoy}">
                        <%-- VISTA CUANDO YA SE REGISTRÓ HOY --%>
                        <h3 class="font-semibold text-xl mb-4">Peso Registrado Hoy</h3>
                        <p class="text-gray-700 mb-4">Ya has registrado tu peso hoy. ¡Buen trabajo!</p>
                        <form action="ProgresoServlet" method="POST">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="idProgreso" value="${progresoHoy.idProgreso}">
                            
                            <label for="pesoActual" class="block text-sm font-medium text-gray-700">Corregir Peso (kg)</label>
                            <div class="mt-1 flex items-center gap-4">
                                <input type="number" name="pesoActual" id="pesoActual" value="${progresoHoy.pesoSemana}" min="30" step="0.1" class="shadow-sm appearance-none border rounded w-full py-2 px-3 text-gray-700 focus:outline-none focus:ring-2 focus:ring-green-500">
                                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg transition">Corregir</button>
                            </div>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <%-- VISTA PARA REGISTRAR POR PRIMERA VEZ EN EL DÍA --%>
                        <h3 class="font-semibold text-xl mb-4">Registrar Peso de Hoy</h3>
                        <form action="ProgresoServlet" method="POST">
                            <label for="pesoActual" class="block text-sm font-medium text-gray-700">Peso Actual (kg)</label>
                            <div class="mt-1">
                                <input type="number" name="pesoActual" id="pesoActual" required min="30" step="0.1" class="shadow-sm appearance-none border rounded w-full py-2 px-3 text-gray-700 focus:outline-none focus:ring-2 focus:ring-green-500">
                            </div>
                            <button type="submit" class="mt-4 w-full bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition">Guardar Progreso</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <c:if test="${not empty listaProgreso}">
                <div class="bg-white p-6 rounded-lg shadow-sm">
                    <h3 class="font-semibold text-xl mb-4">Progreso Hacia Tu Meta</h3>
                    <c:set var="progresoActual" value="${listaProgreso[0]}" />
                    <c:set var="progresoInicial" value="${listaProgreso[listaProgreso.size() - 1]}" />
                    <c:set var="pesoInicial" value="${progresoInicial.pesoSemana}" />
                    <c:set var="pesoActual" value="${progresoActual.pesoSemana}" />
                    <c:set var="pesoMeta" value="${progresoActual.pesoMeta}" />

                    <c:if test="${pesoMeta > 0}">
                         <c:choose>
                            <c:when test="${pesoInicial > pesoMeta}">
                                <c:set var="totalARecorrer" value="${pesoInicial - pesoMeta}" />
                                <c:set var="recorrido" value="${pesoInicial - pesoActual}" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="totalARecorrer" value="${pesoMeta - pesoInicial}" />
                                <c:set var="recorrido" value="${pesoActual - pesoInicial}" />
                            </c:otherwise>
                        </c:choose>
                        
                        <c:set var="porcentaje" value="${totalARecorrer > 0 ? (recorrido / totalARecorrer) * 100 : 0}" />
                        <c:set var="porcentajeAncho" value="${porcentaje < 0 ? 0 : (porcentaje > 100 ? 100 : porcentaje)}" />

                        <div class="flex justify-between mb-1">
                            <span class="text-base font-medium text-blue-700">Progreso</span>
                            <span class="text-sm font-medium text-blue-700"><fmt:formatNumber value="${porcentaje}" maxFractionDigits="0"/>%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-4">
                            <div class="bg-blue-600 h-4 rounded-full" style="width: ${porcentajeAncho}%;"></div>
                        </div>
                        <div class="flex justify-between text-xs font-medium text-gray-500 mt-1">
                            <span>Inicio: ${pesoInicial} kg</span>
                            <span class="font-bold">Actual: ${pesoActual} kg</span>
                            <span>Meta: ${pesoMeta} kg</span>
                        </div>
                    </c:if>
                </div>
                    <div class="btn-descargar-historial-progreso">
        <%-- Añade este enlace donde quieras que aparezca el botón de descarga --%>
<%-- "ExportarServlet" debe coincidir con el @WebServlet del nuevo servlet --%>
<a href="ExportarServlet" 
   class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded-lg transition no-underline">
   Descargar Historial en Excel
</a>
        </div>
            </c:if>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-sm">
            <h3 class="font-semibold text-xl mb-4">Gráfico de Progreso</h3>
            <div class="h-96">
                <canvas id="progresoChart"></canvas>
            </div>
        </div>
        
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx = document.getElementById('progresoChart');
        if (!ctx) return;

        const labels = [];
        const data = [];

        // 1. Llenamos los arrays con el HISTORIAL de progreso que viene de la base de datos
        // La lista ya viene ordenada del más reciente al más antiguo desde el DAO
        <c:forEach var="progreso" items="${listaProgreso}">
            var fecha = new Date('${progreso.fecha}');
            var fechaFormateada = fecha.toLocaleDateString('es-ES', { day: '2-digit', month: '2-digit', year: '2-digit' });
            labels.unshift(fechaFormateada); // unshift() los añade al principio, invirtiendo el orden
            data.unshift(${progreso.pesoSemana});
        </c:forEach>
        
        // =========================================================================
        // == CAMBIO CLAVE: AÑADIMOS SIEMPRE EL PUNTO DE PARTIDA (INICIO) ==
        // =========================================================================
        // 2. Ahora, añadimos SIEMPRE el peso con el que se registró el usuario como el primer punto.
        // Hemos quitado la condición "if (labels.length === 0)".
        labels.unshift("Inicio");
        data.unshift(${sessionScope.usuario.pesoActual});

        Chart.register(ChartDataLabels);

        new Chart(ctx.getContext('2d'), {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Peso (kg)',
                    data: data,
                    borderColor: 'rgb(22, 163, 74)',
                    backgroundColor: 'rgba(22, 163, 74, 0.1)',
                    fill: true,
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: { y: { beginAtZero: false } },
                plugins: {
                    legend: { display: true },
                    datalabels: {
                        anchor: 'end',
                        align: 'top',
                        backgroundColor: 'rgba(255, 255, 255, 0.8)',
                        borderRadius: 4,
                        padding: 4,
                        color: '#333',
                        font: {
                            weight: 'bold',
                            size: 12
                        },
                        formatter: function(value, context) {
                            const label = labels[context.dataIndex];
                            return value.toFixed(1) + ' kg\n' + label;
                        }
                    }
                }
            }
        });
    });
</script>

<%@ include file="footer.jsp" %>