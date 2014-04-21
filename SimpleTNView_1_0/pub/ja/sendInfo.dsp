<html>
	<head><title>Web Manager Document Submission Results</title></head>
	<link rel="stylesheet" type="text/css" href="webMethods.css">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>

	<body>
		<table width="100%">
			<tr><td class="menusection-Server">Web Manager &gt; Document Submission
																					&gt; Results&nbsp;</td></tr>
			<tr>
				<td valign="top">
					<ul>
						<li><a href="sendDoc.dsp">Return to document submission to host Trading Networks system</a></li>
						<li><a href="sendDocOtherTN.dsp">Return to document submission to another Trading Networks system</a></li>
					</ul>
				</td>
			</tr>

			<tr>
				<td>
					<table>
						<tr><td class="heading" colspan="2">Submission results</td></tr>
			
			%invoke wm.tnweb.page:sendDocPageFlow%
				%ifvar displayRec -notempty%
						%ifvar /sendMethod equals('route')%
						<tr><td class="oddrow-l" colspan="2">XML document routed successfully!</td></tr>
						%else%
						<tr><td class="oddrow-l" colspan="2">XML document sent successfully!</td></tr>
						%end ifvar%
						<tr>
							<td class="evenrow">Document Type</td>
							<td class="evenrow-l">%value /displayRec/doctype% &nbsp;</td>
						</tr>
						<tr>
							<td class="evenrow">Processing Status</td>
							<td class="evenrow-l">%value /displayRec/processingStatus% &nbsp;</td>
						</tr>
						<tr>
							<td class="evenrow">User Status</td>
							<td class="evenrow-l">%value /displayRec/userStatus% &nbsp;</td>
						</tr>
						<tr>
							<td class="evenrow">Sender</td>
							<td class="evenrow-l">%value /displayRec/sender% &nbsp;</td>
						</tr>
						<tr>
							<td class="evenrow">Receiver</td>
							<td class="evenrow-l">%value /displayRec/receiver% &nbsp;</td>
						</tr>
				%else%	
						<tr><td class="oddrow-l" colspan="2">XML document was not sent.</td></tr>
				%end ifvar%
			%end invoke%
					</table>
				</td>
			</tr>
		</table>

	</body>
</html>
