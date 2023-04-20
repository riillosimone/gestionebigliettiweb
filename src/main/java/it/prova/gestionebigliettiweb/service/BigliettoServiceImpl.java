package it.prova.gestionebigliettiweb.service;

import java.util.List;

import javax.persistence.EntityManager;

import it.prova.gestionebigliettiweb.dao.BigliettoDAO;
import it.prova.gestionebigliettiweb.model.Biglietto;
import it.prova.gestionebigliettiweb.web.listener.LocalEntityManagerFactoryListener;

public class BigliettoServiceImpl implements BigliettoService {

	private BigliettoDAO bigliettoDAO;

	@Override
	public void setBigliettoDAO(BigliettoDAO bigliettoDAO) {
		this.bigliettoDAO = bigliettoDAO;
	}

	@Override
	public List<Biglietto> listAll() throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();
		try {

			// injection
			bigliettoDAO.setEntityManager(entityManager);

			return bigliettoDAO.list();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

	@Override
	public Biglietto caricaSingoloElemento(Long idInput) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();
		try {

			// injection
			bigliettoDAO.setEntityManager(entityManager);

			return bigliettoDAO.findOne(idInput);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

	@Override
	public void aggiorna(Biglietto input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();
		try {
			
			entityManager.getTransaction().begin();

			// injection
			bigliettoDAO.setEntityManager(entityManager);

			bigliettoDAO.update(input);

			entityManager.getTransaction().commit();
			
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}

	}

	@Override
	public void inserisciNuovo(Biglietto input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();
		try {
			
			entityManager.getTransaction().begin();

			// injection
			bigliettoDAO.setEntityManager(entityManager);

			bigliettoDAO.insert(input);

			entityManager.getTransaction().commit();
			
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}

	}

	@Override
	public void rimuovi(Long idBigliettoToRemove) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();
		try {
			
			entityManager.getTransaction().begin();

			// injection
			bigliettoDAO.setEntityManager(entityManager);

			bigliettoDAO.delete(bigliettoDAO.findOne(idBigliettoToRemove));

			entityManager.getTransaction().commit();
			
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}

	}

	@Override
	public List<Biglietto> findByExample(Biglietto input) throws Exception {
		EntityManager entityManager = LocalEntityManagerFactoryListener.getEntityManager();
		try {

			// injection
			bigliettoDAO.setEntityManager(entityManager);

			return bigliettoDAO.findByExample(input);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			LocalEntityManagerFactoryListener.closeEntityManager(entityManager);
		}
	}

}
