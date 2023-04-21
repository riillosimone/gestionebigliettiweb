<!doctype html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Visualizza Elemento</title>
</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div class='card'>
				<div class='card-header'>
					<h5>Visualizza dettaglio</h5>
				</div>
				<c:set var="bigliettoInPagina" value="${visualizza_biglietto_attr}"></c:set>

				<div class='card-body'>
					<dl class="row">
						<dt class="col-sm-3 text-right">Provenienza</dt>
						<dd class="col-sm-9">${bigliettoInPagina.getProvenienza()}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Destinazioen:</dt>
						<dd class="col-sm-9">${bigliettoInPagina.getDestinazione()}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Prezzo:</dt>
						<dd class="col-sm-9">${bigliettoInPagina.getPrezzo()}</dd>
					</dl>

					<dl class="row">
						<dt class="col-sm-3 text-right">Data:</dt>
						<dd class="col-sm-9">
							<c:if test="${bigliettoInPagina.getData()!= null}">
								<fmt:parseDate value="${bigliettoInPagina.getData()}"
									pattern="yyyy-MM-dd" var="parsedDate" type="date" />

								<fmt:formatDate value="${parsedDate}" var="newParsedDate"
									type="date" pattern="dd/MM/yyyy" />
								<td>${newParsedDate}</td>
							</c:if>
							<c:if test="${bigliettoInPagina.getData()== null}">
								<td>N.D.</td>
							</c:if>

						</dd>
					</dl>

				</div>

				<div class='card-footer'>
					<a href="ListBigliettiServlet" class='btn btn-outline-secondary'
						style='width: 80px'> <i class='fa fa-chevron-left'></i> Back
					</a>
					
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