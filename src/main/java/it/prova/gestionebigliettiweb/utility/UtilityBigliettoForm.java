package it.prova.gestionebigliettiweb.utility;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.model.Biglietto;

public class UtilityBigliettoForm {

	public static Biglietto createBigliettoFromParams(String provenienzaInputParam, String destinazioneInputParam,
			String dataStringParam, String prezzoStringParam) {

		Biglietto result = new Biglietto(provenienzaInputParam, destinazioneInputParam);

		if (NumberUtils.isCreatable(prezzoStringParam)) {
			result.setPrezzo(Integer.parseInt(prezzoStringParam));
		}
		result.setData(parseDateFromString(dataStringParam));
		return result;
	}

	public static boolean validateBigliettoBean(Biglietto bigliettoToBeValidate) {
		if (StringUtils.isBlank(bigliettoToBeValidate.getProvenienza())
				|| StringUtils.isBlank(bigliettoToBeValidate.getDestinazione())
				|| bigliettoToBeValidate.getPrezzo() == null || bigliettoToBeValidate.getPrezzo() < 1
				|| bigliettoToBeValidate.getData() == null) {
			return false;
		}

		return true;
	}

	public static LocalDate parseDateFromString(String dataStringParam) {
		if (StringUtils.isBlank(dataStringParam))
			return null;

		try {
			return LocalDate.parse(dataStringParam);
		} catch (DateTimeParseException e) {
			return null;
		}
	}

}
