<!doctype html>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Ricerca Elemento</title>
</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">


			<div class='card'>
				<div class='card-header'>
					<h5>Ricerca elemento</h5>
				</div>
				<div class='card-body'>

					<form method="post" action="ExecuteSearchBigliettoServlet"
						class="row g-3" novalidate="novalidate">


						<div class="col-md-6">
							<label for="provenienza" class="form-label">Provenienza</label> <input
								type="text" name="provenienza" id="provenienza"
								class="form-control" placeholder="Inserire la provenienza">
						</div>

						<div class="col-md-6">
							<label for="destinazione" class="form-label">Destinazione</label>
							<input type="text" name="destinazione" id="destinazione"
								class="form-control" placeholder="Inserire la destinazione">
						</div>

						<div class="col-md-6">
							<label for="prezzo" class="form-label">Prezzo</label> <input
								type="number" class="form-control" name="prezzo" id="prezzo"
								placeholder="Inserire prezzo">
						</div>

						<div class="col-md-3">
							<label for="data" class="form-label">Data</label> <input
								class="form-control" name="data" id="data" type="date"
								placeholder="dd/MM/yy" title="formato : gg/mm/aaaa" />
						</div>


						<div class="col-12">

							<a class="btn btn-outline-secondary " href="ListBigliettiServlet">Lista
								Completa</a>
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