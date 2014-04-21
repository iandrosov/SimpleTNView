<html>
	<head>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
		<title>Web Manager Document Submission to Other TN</title>
		<script language="JavaScript">
			// ================================================================ 
			// sendDocToTN()
			// check if user enters required host, port, username and password
			// ================================================================ 
			function sendDocToTN( which ) {
				var protocol;
				var hostName = document.dataForm.host.value;
				var portNumber = document.dataForm.port.value;
				if( hostName.length == 0 ) {
					alert( "Please enter host name or IP address." );
					return;
				}
				if( portNumber.length == 0 ) {
					alert( "Please enter port number." );
					return;
				}
				if( document.dataForm.user.value.length == 0 ||
					document.dataForm.pass.value.length == 0 ) {
					alert( "please enter user name and/or password for " + 
						document.dataFro);
					return;
				}
				if( document.dataForm.protocol.selectedIndex == 0 ) {
					protocol = "http://";
				} else {
					protocol = "https://";
				}
				var hostURL = protocol + hostName + ":" + portNumber;
				document.sendForm.url.value = hostURL + "/invoke/wm.tnweb.helper/receiveWrapper";
				document.sendForm.user.value = document.dataForm.user.value;
				document.sendForm.pass.value = document.dataForm.pass.value;
				document.sendForm.data.value = document.dataForm.doc.value;
				document.sendForm.sign.value = which;
				if( which == "signOut" ) {
						document.sendForm.submit();
				} else if( which == "sendOut" ) {
						document.sendForm.submit();
				} else {
					return;
				}
			}
		</script>
	</head>

	<body>
		<table width="100%">
			<tr><td class="menusection-Server">Web Manager &gt; Document Submission
																					&gt; Other Trading Networks&nbsp;
					</td>
			</tr>
			<tr>
				<td valign="top">
					<ul>
						<li><a href="sendDoc.dsp">Return to document submission to host Trading Networks system</a></li>
					</ul>
				</td>
			</tr>

			<tr>
				<td>
					<table>
						<tr><td class="heading" colspan="2">Submit to other Trading Networks system</td>
						</tr>

						<form name="dataForm">
						<tr>
							<td class="evenrow">Protocol</td>
							<td class="evenrow-l"><select name="protocol" size="1"  >
								<option>HTTP</option>
								<option>HTTPS</option></select>
							</td>
						</tr>
						<tr>
							<td class="evenrow">Host</td>
							<td class="evenrow-l"><input type="text" name="host"></td>
						</tr>
						<tr>
							<td class="evenrow">Port</td>
							<td class="evenrow-l"><input type="text" name="port"></td>
						</tr>
						<tr>
							<td class="evenrow">User name</td>
							<td class="evenrow-l"><input type="text" name="user"></td>
						</tr>
						<tr>
							<td class="evenrow">Password</td>
							<td class="evenrow-l"><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td class="oddrow-l" colspan="2">XML document:</td>
						</tr>
						<tr>
							<td class="oddrow-l" colspan="2">
								<textarea name="doc" rows="15" cols="60"></textarea>
							</td>
						</tr>
						<tr>
							<td class="action" colspan="2">
								<input type="button" name="send" value="Send Document" size="40" onClick="sendDocToTN( 'sendOut' )">
								%invoke wm.tnweb.helper:getUserRights%
									%ifvar Rights equals('TNAdministrators')%
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="Send Signed Document" size="40" onClick="sendDocToTN( 'signOut' )">
									%end ifvar%
								%end invoke%
							</td>
						</tr>
						</form>
					</table>
				</td>
			</tr>
		</table>

		<form name="sendForm" action="sendInfo.dsp" method="post">
			<input type="hidden" name="sendMethod" value="sendTN">
			<input type="hidden" name="url">
			<input type="hidden" name="user">
			<input type="hidden" name="pass">
			<input type="hidden" name="data">
			<input type="hidden" name="sign">
		</form>
		</p>

	</body>
</html>
