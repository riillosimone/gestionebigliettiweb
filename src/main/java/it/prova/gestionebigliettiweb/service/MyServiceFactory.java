package it.prova.gestionebigliettiweb.service;

import it.prova.gestionebigliettiweb.dao.BigliettoDAO;
import it.prova.gestionebigliettiweb.dao.BigliettoDAOImpl;

public class MyServiceFactory {
	
	private static BigliettoService BIGLIETTO_SERVICE_INSTANCE = null;
	private static BigliettoDAO BIGLIETTODAO_INSTANCE = null;

	
	public static BigliettoService getBigliettoServiceInstance() {
		if(BIGLIETTO_SERVICE_INSTANCE == null) {
			BIGLIETTO_SERVICE_INSTANCE = new BigliettoServiceImpl();
		}
		
		if (BIGLIETTODAO_INSTANCE == null) {
			BIGLIETTODAO_INSTANCE = new BigliettoDAOImpl();
		}
		
		BIGLIETTO_SERVICE_INSTANCE.setBigliettoDAO(BIGLIETTODAO_INSTANCE);
		
		return BIGLIETTO_SERVICE_INSTANCE;
	}
}
