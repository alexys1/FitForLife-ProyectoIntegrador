<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Cerramos las etiquetas abiertas en header.jsp --%>
            </div>
        </main>
    </div>
</div>

<footer class="bg-gray-800 text-gray-300">
    <div class="container mx-auto px-6 py-10">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
            
            <div>
                <h3 class="text-2xl font-bold text-white">FitForLife</h3>
                <p class="mt-4 text-sm">Tu compañero personal para una vida más saludable. Monitorea tu nutrición y alcanza tus metas.</p>
            </div>

            <div>
                <h4 class="text-lg font-semibold text-white">Navegación</h4>
                <ul class="mt-4 space-y-2">
                    <li><a href="PanelServlet" class="hover:text-green-400 transition">Panel Principal</a></li>
                    <li><a href="#" class="hover:text-green-400 transition">Características</a></li>
                    <li><a href="#" class="hover:text-green-400 transition">Planes</a></li>
                    <li><a href="#" class="hover:text-green-400 transition">Blog</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold text-white">Compañía</h4>
                <ul class="mt-4 space-y-2">
                    <li><a href="#" class="hover:text-green-400 transition">Sobre Nosotros</a></li>
                    <li><a href="#" class="hover:text-green-400 transition">Contacto</a></li>
                    <li><a href="#" class="hover:text-green-400 transition">Términos de Servicio</a></li>
                    <li><a href="#" class="hover:text-green-400 transition">Política de Privacidad</a></li>
                </ul>
            </div>

            <div>
                <h4 class="text-lg font-semibold text-white">Síguenos</h4>
                <div class="mt-4 flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-white transition" aria-label="Facebook">
                        <%-- Icono de Facebook (SVG) --%>
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24"><path fill-rule="evenodd" d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z" clip-rule="evenodd" /></svg>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition" aria-label="Twitter">
                        <%-- Icono de Twitter (SVG) --%>
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24"><path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.71v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" /></svg>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition" aria-label="Instagram">
                        <%-- Icono de Instagram (SVG) --%>
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24"><path fill-rule="evenodd" d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.024.06 1.378.06 3.808s-.012 2.784-.06 3.808c-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.024.048-1.378.06-3.808.06s-2.784-.012-3.808-.06c-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.048-1.024-.06-1.378-.06-3.808s.012-2.784.06-3.808c.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 016.345 2.525c.636-.247 1.363-.416 2.427-.465C9.795 2.013 10.148 2 12.315 2zm-1.152 4.873a.75.75 0 011.06 0l3.085 3.085a.75.75 0 01-1.06 1.06L12 9.06l-2.22 2.22a.75.75 0 01-1.06-1.06l3.085-3.085z" clip-rule="evenodd" /></svg>
                    </a>
                </div>
            </div>
        </div>

        <div class="mt-8 border-t border-gray-700 pt-6 text-center">
            <%-- Usamos JSTL para obtener el año actual dinámicamente --%>
            <jsp:useBean id="now" class="java.util.Date" />
            <p class="text-sm">
                &copy; <fmt:formatDate value="${now}" pattern="yyyy" /> FitForLife. Todos los derechos reservados.
            </p>
        </div>
    </div>
</footer>

</body>
</html>