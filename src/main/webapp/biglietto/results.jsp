<%@page
	import="it.prova.gestionebigliettiweb.web.servlet.ListBigliettiServlet"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Lista Elementi</title>
</head>

<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div
				class="alert alert-success alert-dismissible fade show  ${successMessage==null?'d-none':'' }"
				role="alert">
				${successMessage}
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
					<h5>Lista dei risultati</h5>
				</div>
				<div class='card-body'>
					<a class="btn btn-primary " href="PrepareInsertBigliettoServlet">Add
						New</a> <a class="btn btn-primary "
						href="PrepareSearchBigliettoServlet">Ricerca</a>
					<div class='table-responsive'>
						<table class='table table-striped '>
							<thead>
								<tr>
									<th>Id</th>
									<th>Provenienza</th>
									<th>Destinazione</th>
									<th>Prezzo</th>
									<th>Data</th>
									<th>Azioni</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${listaBigliettiAttribute}" var="item">


									<tr>
										<td>${item.getId()}</td>
										<td>${item.getProvenienza()}</td>
										<td>${item.getDestinazione()}</td>
										<td>${item.getPrezzo()}</td>

										<c:if test="${item.getData()!= null}">
											<fmt:parseDate value="${item.getData()}" pattern="yyyy-MM-dd"
												var="parsedDate" type="date" />

											<fmt:formatDate value="${parsedDate}" var="newParsedDate"
												type="date" pattern="dd/MM/yyyy" />
											<td>${newParsedDate}</td>
										</c:if>
										<c:if test="${item.getData()== null}">
											<td>N.D.</td>
										</c:if>
										<td><a class="btn  btn-sm btn-outline-secondary"
											href="ExecuteVisualizzaBigliettoServlet?idBiglietto=${item.getId()}">Visualizza</a>
											<a class="btn  btn-sm btn-outline-primary ml-2 mr-2"
											href="PrepareEditBigliettoServlet?idBiglietto=${item.getId()}">Edit</a>
											<a class="btn btn-outline-danger btn-sm"
											href="PrepareDeleteBigliettoServlet?idBiglietto=${item.getId()}">Delete</a>
										</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- end card-body -->
				</div>
				<!-- end card -->
			</div>


			<!-- end container -->
		</div>

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />

	<!-- Modal conferma delete -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Conferma
						Operazione</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Continuare con l'operazione?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Annulla</button>
					<button type="button" class="btn btn-primary">Continua</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Modal conferma delete -->

</body>
</html>