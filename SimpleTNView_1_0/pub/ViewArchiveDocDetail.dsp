<html>

<head>
	<title>Transaction Analysis Document Detail</title>
	<link rel="stylesheet" type="text/css" href="webMethods.css">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>

	<script language="JavaScript">
		function popUpDoc( URL, title ) {
			var OpenContent = window.open (URL,title,'width=800,height=700,scrollbars=yes,toolbar=no,location=no,resizable=yes');
			}
	</script>
</head>

<body>
	<table width="100%" >
		<tr width="100%">
			<td class="menusection-Logs2" colspan=2>Analysis &gt; Transactions &gt; Document Details&nbsp;</td>
		</tr>
 
		<tr>
			<td valign="top">
				<ul>
<!--
					<li><a href="transactionAnalysis.dsp">Return to Transaction Analysis</a></li>
-->
					<li><a href="ViewArchiveDocActivities.dsp?internalId=%value /docId%">View Archive Document Activity Log</a></li>

		%invoke SimpleTNView.queryFlow:viewArchiveDocPageFlow%

					%ifvar resultCount equals('0')%
					%else%
						<li><a href="ViewArchiveDocTasks.dsp?docId=%value /docId%">View Archive Document Tasks</a></li>
					%endif resultCount%

					%ifvar relatedDocs%
						%loop relatedDocs%
							%ifvar from vequals(/docId)%
								<li><a href="JavaScript:popUpDoc('ViewArchiveDocDetail.dsp?docId=%value to%','relatedFrom');">View Related Document (%value relationship%)</a></li>
							%endif from%
							%ifvar to vequals(/docId)%
								<li><a href="JavaScript:popUpDoc('ViewArchiveDocDetail.dsp?docId=%value from%','relatedTo');">View Related Document (%value relationship%)</a></li>
							%endif to%
						%endloop relatedDocs%
					%endif relatedDocs%
				</ul>
			</td>
		</tr>

		<!--- Doc Attr --->
		<tr>
			<td>
				<table width="100%">
					<tr><td class="heading" colspan="2">Document Attributes</td></tr>
					<tr>
						<td class="evenrow">Date</td>
						<td class="evenrow-l">%value bizdoc/DocTimestamp%&nbsp;</td>
					</tr>
					<tr>
						<td class="evenrow">Document Type</td>
						<td class="evenrow-l">%value bizdoc/TypeName% &nbsp;</td>
					</tr>
					<tr>
						<td class="evenrow">Sender</td>
						<td class="evenrow-l">%value SenderCorp% &nbsp;</td>
					</tr>
					<tr>
						<td class="evenrow">Receiver</td>
						<td class="evenrow-l">%value ReceiverCorp% &nbsp;</td>
					</tr>
					<tr>
						<td class="evenrow">Document ID</td>
						<td class="evenrow-l">%value bizdoc/DocumentID% &nbsp;</td>
					</tr>
					<tr>
						<td class="evenrow">Processing Status</td>
						<td class="evenrow-l">%value bizdoc/SystemStatus% &nbsp;</td>
					</tr>
					<tr>
						<td class="evenrow">User Status</td>
						<td class="evenrow-l">%value bizdoc/UserStatus% &nbsp;</td>
					</tr>

					%scope bizdoc%
						%ifvar Attributes%
							%loop -struct Attributes%
							<tr>
								<td class="evenrow">%value $key% &nbsp;</td>
								<td class="evenrow-l">%value% &nbsp;</td>
							</tr>
							%endloop%
						%endif% 
					%endscope% 
				</table>
			</td>
		</tr>

		<!--- Doc Action --->
		%ifvar DocOptions%
		<tr>
			<td>
				<table width="100%">
					<tr><td class="heading" colspan="2">Document Actions</td></tr>
					%loop DocOptions%
					<form name="%value Action%" method="post" action="%value Service%?docId=%value /docId%">
					<input type="hidden" name="docId" value="%value /docId%">
					<tr>
						<td class="evenrow-l" colspan="2">
							<a href="%value Service%?docId=%value /docId%" onclick="document.%value Action%.submit();return false;">%value Action%</a>
						</td>
					</tr>
					<tr>
						<td class="evenrow">%value Description% &nbsp; 
						</td>
						<td class="evenrow-l">
							%ifvar Inputs%
							<table>
								%loop Inputs%
								<tr>
									<td>%value Inputs% &nbsp;</td> 
									<td><INPUT name="%value%" size=30></td>
								</tr>
								%endloop Inputs%
							</table>
							%endif Inputs%
						</td>
					</tr>
					%loop ChoiceList%
					%scope Choice%
					<tr>
						<td class="evenrow">%value Name% &nbsp;</td> 
						<td class="evenrow-l">
							<select name="%value Name%" size="1">
								<option name="%value Name%" value="" selected>
								</option>
								%loop Values%
								<option name="%value Name%" value="%value Values%">%value% &nbsp;
								</option>
								%endloop Values%
							</select>
						</td>
					</tr>
					%end scope Choice%
					%endloop ChoiceList%
					</form>
					%endloop DocOptions%
				</table>
			</td>
		</tr>
		%end ifvar DocOptions%

		<tr>
			<td>
				<table width="100%">
					<tr><td class="heading" colspan="5">Content Parts (%value partsLength% total)</td></tr>
					<tr>
						<td class="oddcol">Name</td>
						<td class="oddcol">Length</td>
						<td class="oddcol">Type</td>
						<td class="oddcol">Storage Type</td>
						<td class="oddcol">Storage Reference</td>
					</tr>
					%loop contentParts%
					<tr>
						%ifvar type equals('application/x-wmidatabin')%
						<td class="evencol-l">%value name%</td>
						%else%
						<td class="evencol-l"><a href="ViewArchiveDocContents.dsp?docId=%value /docId%&partName=%value name%">%value name%</a> &nbsp;</td>
						%endif%
						<td class="evencol-l">%value length%&nbsp;</td>
						<td class="evencol-l">%value type%&nbsp;</td>
						<td class="evencol-l">%value storageType%&nbsp;</td>
						<td class="evencol-l">%value storageReference%&nbsp;</td>
					</tr>
					%endloop%
				</table>
			</td>
		</tr>
		<tr><td></td></tr>
	%endinvoke%						
	</table>
</body>
</html>
