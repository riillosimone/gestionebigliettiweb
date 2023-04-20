package it.prova.gestionebigliettiweb.service;

import java.util.List;

import it.prova.gestionebigliettiweb.dao.BigliettoDAO;
import it.prova.gestionebigliettiweb.model.Biglietto;

public interface BigliettoService {

	public void setBigliettoDAO (BigliettoDAO bigliettoDAO);
	
	public List<Biglietto> listAll() throws Exception;
	
	public Biglietto caricaSingoloElemento(Long idInput) throws Exception;
	
	public void aggiorna(Biglietto input) throws Exception;

	public void inserisciNuovo(Biglietto input) throws Exception;
	
	public void rimuovi(Long idBigliettoToRemove) throws Exception;
	
	public List<Biglietto> findByExample(Biglietto input) throws Exception;
}
