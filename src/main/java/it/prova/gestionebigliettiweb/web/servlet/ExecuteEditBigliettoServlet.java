package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.model.Biglietto;
import it.prova.gestionebigliettiweb.service.MyServiceFactory;
import it.prova.gestionebigliettiweb.utility.UtilityBigliettoForm;

/**
 * Servlet implementation class ExecuteEditBigliettoServlet
 */
@WebServlet("/ExecuteEditBigliettoServlet")
public class ExecuteEditBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// validazione ID
		String idBigliettoParam = request.getParameter("idBigliettoToEdit");
		if (!NumberUtils.isCreatable(idBigliettoParam)) {
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		Long idBigliettoToEdit = Long.parseLong(idBigliettoParam);
		// estraggo input
		// estraggo input
		String provenienzaInputParam = request.getParameter("provenienza");
		String destinazioneInputParam = request.getParameter("destinazione");
		String prezzoInputParam = request.getParameter("prezzo");
		String dataInputParam = request.getParameter("data");

		// preparo un bean
		Biglietto bigliettoInstance = UtilityBigliettoForm.createBigliettoFromParams(provenienzaInputParam,
				destinazioneInputParam, dataInputParam, prezzoInputParam);
		bigliettoInstance.setId(idBigliettoToEdit);
		if (!UtilityBigliettoForm.validateBigliettoBean(bigliettoInstance)) {
			request.setAttribute("bigliettoDaInviareAPaginaEdit", bigliettoInstance);
			request.setAttribute("errorMessage", "Attenzione, sono presenti errori di validazione");
			request.getRequestDispatcher("/biglietto/edit.jsp").forward(request, response);
			return;
		}

		try {
			MyServiceFactory.getBigliettoServiceInstance().aggiorna(bigliettoInstance);
			request.setAttribute("listaBigliettiAttribute", MyServiceFactory.getBigliettoServiceInstance().listAll());
			request.setAttribute("successMessage", "Operazione effettuata con successo");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		// forward
		request.getRequestDispatcher("/biglietto/results.jsp").forward(request, response);

	}

}
