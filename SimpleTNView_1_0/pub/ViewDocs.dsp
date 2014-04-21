<html>

	<head>
		<title>TN search result</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body >

		<table width="100%" >
			<tr width="100%">
				<td class="menusection-Logs" colspan=2>TN search result&nbsp;</td>
			</tr>

<!--
			<tr>
				<td valign="top">
					<ul>
						<li><a href="transactionAnalysis.dsp">Return to Transaction Analysis</a></li>
					</ul>
				</td>
			</tr>
-->

			<tr>
				<td>
					<table>

						<!-- title bar -->
						<tr>
							<td class="heading" colspan=2>search criteria</td>
						</tr>
<!-- 
						<tr>
							<td colspan="2" class="oddrow" nowrap> &nbsp;&nbsp;&nbsp; Note pre-saved query overrides all other search criteria. &nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td class="evenrow">Pre-saved Query</td>
							%ifvar Query%
							<td class="evenrow-l">&nbsp;&nbsp;%value Query%</td>
							%else%
							<td class="evenrow-l">&nbsp;&nbsp;</td>
							%endif%
						</tr>
 -->
						%ifvar FromDate%
						<tr>
							<td class="evenrow">start date</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value FromDate%</td>
						</tr>
						%endif%
						%ifvar ToDate%
						<tr>
							<td class="evenrow">end date</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value ToDate%</td>
						</tr>
						%endif%
						%ifvar ProcessingStatus%
						<tr>
							<td class="evenrow">Processing Status</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value ProcessingStatus%</td>
						</tr>
						%endif%
						%ifvar Status%
						<tr>
							<td class="evenrow">User Status</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value Status%</td>
						</tr>
						%endif%
						%ifvar DocTypeName%
						<tr>
							<td class="evenrow">Document Type</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value DocTypeName%</td>
						</tr>
						%endif%
						%ifvar SenderName%
						<tr>
							<td class="evenrow">Sender</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value SenderName%</td>
						</tr>
						%endif%
						%ifvar ReceiverName%
						<tr>
							<td class="evenrow">Receiver</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value ReceiverName%</td>
						</tr>
						%endif%
						%ifvar NativeDocID%
						<tr>
							<td class="evenrow">Document ID</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value NativeDocID%</td>
						</tr>
						%endif%
						%ifvar SortBy%
						<tr>
							<td class="evenrow">results sorted by</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value SortCriteria%</td>
						</tr>
						%endif%
						%ifvar MaxReturned%
						<tr>
							<td class="evenrow">maximum display</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value MaxReturned%</td>
						</tr>
						%endif%

		%invoke SimpleTNView.svc:Ex_searchPageSearch%
					<tr>
						<td class="evenrow">documents retrieved</td>
						<td class="evenrow-l">&nbsp;&nbsp;%value NumDocs%</td>
					</tr>

						<!-- title bar -->
					</table>
				</td>
			</tr>

<!-- 			<tr><td>&nbsp;</td></tr>
 -->

			<tr>
				<td>
					<table width="100%">

					%ifvar Docs%
						<tr><td class="heading" colspan="7">Received documents</td></tr>
						<tr>
							<td class="oddcol">Date</td>
							<td class="oddcol">Type</td>
							<td class="oddcol">From</td>
							<td class="oddcol">To</td>
							<td class="oddcol">DocID</td>
							<td class="oddcol">Processing Status</td>
							<td class="oddcol">User Status</td>
						</tr>
						%loop Docs%
						<tr>
							<td class="evenrow-l"><a href="ViewDocDetail.dsp?docId=%value DocID%">%value DocTimestamp%</a> &nbsp;</td>
							<td class="evenrow-l">%value TypeName% &nbsp;</td>
							<td class="evenrow-l">%value SenderName% &nbsp;</td>
							<td class="evenrow-l">%value ReceiverName% &nbsp;</td>
							<td class="evenrow-l">%value NativeID% &nbsp;</td>
							<td class="evenrow-l">%value RoutingStatus% &nbsp;</td>
							<td class="evenrow-l">%value UserStatus% &nbsp;</td>
						</tr>
						%endloop Docs%
						<tr><td></td></tr>
					%endif Docs%

					<tr><td></td></tr>
				</table>
			</td>
		</tr>
	</table>

			%onerror%
			<hr>
			<p><font color="red">The Server could not process your request because the following error occurred. Contact your server administrator.</font></p>
			<TABLE WIDTH="30%" BORDER="1"> <TR><TD><B>Service</B></TD><TD>%value errorService%</TD></TR>
				<TR><TD><B>Error</B></TD><TD>%value error% &nbsp; %value errorMessage%</TD></TR>
				<TR><TD><B>Error Inputs</B></TD><TD>%value errorInputs% &nbsp;  </TD></TR>
				<TR><TD><B>Error Outputs</B></TD><TD>%value errorOutputs% &nbsp; </TD></TR> 
			</TABLE>
			%end invoke searchPageSearch%

		<p>&nbsp;</p>

	</body>
</html>
