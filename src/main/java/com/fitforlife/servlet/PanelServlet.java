package com.fitforlife.servlet;

import com.fitforlife.dto.UsuarioDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.fitforlife.dao.IMCRegistroDAO; 
import com.fitforlife.dto.IMCRegistroDTO;
import com.fitforlife.dao.PlanDAO;
import com.fitforlife.dto.PlanDTO;
import com.fitforlife.util.ConexionBD;
import java.sql.Connection;
import com.fitforlife.dao.ConsumoDiarioDAO;
import java.util.Map;

@WebServlet("/PanelServlet")
public class PanelServlet extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");
    HttpSession sesion = req.getSession(false);
    if (sesion == null || sesion.getAttribute("usuario") == null) {
        resp.sendRedirect("login.jsp");
        return;
    }

    UsuarioDTO usuario = (UsuarioDTO) sesion.getAttribute("usuario");
    
    // ======================= INICIO DE LA PRUEBA DE DEPURACIÓN =======================
    System.out.println("\n\n--- [DEBUG PANEL SERVLET] ---");
    System.out.println("Iniciando carga del panel para el usuario: " + usuario.getNombre() + " (ID: " + usuario.getIdUsuario() + ")");
    // =================================================================================

    try (Connection conn = ConexionBD.getConnection()) {
        
        // --- Lógica para Plan e IMC (la dejamos como está) ---
        PlanDAO planDAO = new PlanDAO(conn);
        PlanDTO planAsignado = planDAO.obtenerPlanPorUsuario(usuario.getIdUsuario());
        req.setAttribute("planAsignado", planAsignado);
        
        IMCRegistroDAO imcDAO = new IMCRegistroDAO(conn);
        IMCRegistroDTO ultimoIMC = imcDAO.obtenerUltimoIMCporUsuario(usuario.getIdUsuario());
        req.setAttribute("ultimoIMC", ultimoIMC);
        
        // --- Lógica de Consumo (Aquí está la clave) ---
        ConsumoDiarioDAO consumoDAO = new ConsumoDiarioDAO(conn);
        
        // ======================= PRUEBA DE DEPURACIÓN CLAVE ==========================
        System.out.println("[DEBUG PANEL SERVLET] -> Llamando al DAO: obtenerResumenConsumoHoy()...");
        Map<String, Double> resumenConsumo = consumoDAO.obtenerResumenConsumoHoy(usuario.getIdUsuario());
        
        // ¡ESTA LÍNEA ES LA MÁS IMPORTANTE! NOS DIRÁ QUÉ TRAJO DE LA BASE DE DATOS.
        System.out.println("[DEBUG PANEL SERVLET] -> Resultado recibido del DAO: " + resumenConsumo);
        // =================================================================================
        
        req.setAttribute("resumenConsumo", resumenConsumo);

    } catch (Exception e) {
        System.out.println("[DEBUG PANEL SERVLET] !!! OCURRIÓ UNA EXCEPCIÓN !!!");
        e.printStackTrace(); // Imprime el error completo en la consola
    }
    
    // ======================= FIN DE LA PRUEBA DE DEPURACIÓN ========================
    System.out.println("[DEBUG PANEL SERVLET] -> Redirigiendo a panel.jsp");
    System.out.println("--- [FIN DEBUG] ---\n\n");
    // ==============================================================================
    
    req.getRequestDispatcher("panel.jsp").forward(req, resp);
}
}