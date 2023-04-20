package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.service.MyServiceFactory;


/**
 * Servlet implementation class PrepareEditBigliettoServlet
 */
@WebServlet("/PrepareEditBigliettoServlet")
public class PrepareEditBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parametroIdBigliettoToEdit = request.getParameter("idBiglietto");
		if (!NumberUtils.isCreatable(parametroIdBigliettoToEdit)) {
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		Long idBigliettoToEdit = Long.parseLong(parametroIdBigliettoToEdit);

		try {
			request.setAttribute("bigliettoDaInviareAPaginaEdit",
					MyServiceFactory.getBigliettoServiceInstance().caricaSingoloElemento(idBigliettoToEdit));
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/biglietto/edit.jsp").forward(request, response);
	}

	

}
