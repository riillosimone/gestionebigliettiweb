<!doctype html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Modifica Elemento</title>
</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }"
				role="alert">
				${errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-danger alert-dismissible fade show d-none"
				role="alert">
				Esempio di operazione fallita!
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-info alert-dismissible fade show d-none"
				role="alert">
				Aggiungere d-none nelle class per non far apparire
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>

			<div class='card'>
				<div class='card-header'>
					<h5>Modifica elemento</h5>
				</div>
				<div class='card-body'>

					<h6 class="card-title">
						I campi con <span class="text-danger">*</span> sono obbligatori
					</h6>


					<form method="post" action="ExecuteEditBigliettoServlet"
						class="row g-3" novalidate="novalidate">
						<c:set var="bigliettoInPagina"
							value="${bigliettoDaInviareAPaginaEdit}"></c:set>

						<div class="col-md-6">
							<label for="provenienza" class="form-label">Provenienza <span
								class="text-danger">*</span></label>
							<c:set var="provenienza"
								value="${bigliettoInPagina.getProvenienza()}"></c:set>
							<c:if test="${provenienza!=null}">
								<input type="text" name="provenienza" id="provenienza"
									class="form-control" placeholder="Inserire la provenienza"
									value="${provenienza}" required>
							</c:if>
							<c:if test="${provenienza==null}">
								<input type="text" name="provenienza" id="provenienza"
									class="form-control" placeholder="Inserire la provenienza"
									value="" required>
							</c:if>
						</div>

						<div class="col-md-6">
							<label for="destinazione" class="form-label">Destinazione
								<span class="text-danger">*</span>
							</label>
							<c:set var="destinazione"
								value="${bigliettoInPagina.getDestinazione()}"></c:set>
							<c:if test="${destinazione!=null}">
								<input type="text" name="destinazione" id="destinazione"
									class="form-control" placeholder="Inserire la destinazione"
									value="${destinazione}" required>
							</c:if>
							<c:if test="${destinazione==null}">
								<input type="text" name="destinazione" id="destinazione"
									class="form-control" placeholder="Inserire la destinazione"
									value="" required>
							</c:if>
						</div>

						<div class="col-md-6">
							<label for="prezzo" class="form-label">Prezzo <span
								class="text-danger">*</span></label>
							<c:set var="prezzo" value="${bigliettoInPagina.getPrezzo()}"></c:set>
							<c:if test="${prezzo!=null}">
								<input type="text" name="prezzo" id="prezzo"
									class="form-control" placeholder="Inserire il prezzo"
									value="${prezzo}" required>
							</c:if>
							<c:if test="${prezzo==null}">
								<input type="text" name="prezzo" id="prezzo"
									class="form-control" placeholder="Inserire il prezzo" value=""
									required>
							</c:if>
						</div>

						<div class="col-md-3">
							<label for="data" class="form-label">Data<span
								class="text-danger">*</span></label><c:if test="${bigliettoInPagina.getData()!= null}">
								<fmt:parseDate value="${bigliettoInPagina.getData()}"
									pattern="yyyy-MM-dd" var="parsedDate" type="date" />

								<fmt:formatDate value="${parsedDate}" var="newParsedDate"
									type="date" pattern="dd/MM/yyyy" />
								<input class="form-control" name="data" id="data" type="date"
									placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
									value="${parsedDate}" required />

							</c:if>
							<c:if test="${bigliettoInPagina.getData()== null}">
								<input class="form-control" name="data" id="data" type="date"
									placeholder="dd/MM/yy" title="formato : gg/mm/aaaa" value=""
									required />
							</c:if>
						</div>


						<div class="col-12">
							<a href="ListBigliettiServlet" class='btn btn-outline-secondary'
								style='width: 80px'> <i class='fa fa-chevron-left'></i> Back
							</a> <input type="hidden" name="idBigliettoToEdit"
								value="${bigliettoInPagina.getId()}">
							<button type="submit" name="submit" value="submit" id="submit"
								class="btn btn-primary">Conferma</button>

						</div>

					</form>



					<!-- end card-body -->
				</div>
				<!-- end card -->
			</div>


			<!-- end container -->
		</div>

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>