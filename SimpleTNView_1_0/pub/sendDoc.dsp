<html>
	<head>
		<title>Web Manager Document Submission</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<script language="JavaScript">
			function sendDoc( method ) {
				document.sendForm.data.value = document.dataForm.doc.value;
				document.sendForm.sendMethod.value = method;
				if( method == "send" ) {
						document.sendForm.submit();
				} else if( method == "route" ) {
						document.sendForm.submit();
				}
			}
		</script>
	</head>

	<body>
		<table width="100%">
			<tr><td class="menusection-Server">Web Manager &gt; Document Submission&nbsp;</td></tr>

			%invoke wm.tnweb.helper:getUserRights%
			<tr>
				<td valign="top">
					<ul>
						<li><a href="sendDocOtherTN.dsp">Submit document to another Trading Networks system</a></li>
						%ifvar Rights equals('TNAdministrators')%
						<li><a href="sendDocOtherTN.dsp">Submit digitally signed document</a></li>
						%endif Rights%
					</ul>
				</td>
			</tr>

			<tr>
				<td>
					<table>
						<tr><td class="heading">Submit to host Trading Networks %value $host%</td></tr>

						<form name="dataForm" action="sendInfo.dsp" method="post">
						<tr><td class="evenrow-l">XML document:</td></tr>
						<tr>
							<td class="evenrow-l">
								<textarea name="doc" rows="15" cols="60"></textarea>
							</td>
						</tr>
						<tr>
							<td class="action">
								<input type="button" value="Send Document" onClick="sendDoc('send')">
									%ifvar Rights equals('TNAdministrators')%
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="Route Document" onClick="sendDoc('route')">
									%end ifvar%
							</td>
						</tr>
						</form>
					</table>
				</td>
			</tr>
			%end invoke%
		</table>

			<form name="sendForm" action="sendInfo.dsp" method="post">
				<input type="hidden" name="sendMethod">
				<input type="hidden" name="data">
			</form>

	</body>
</html>
