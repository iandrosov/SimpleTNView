<html>

	<head>
		<title>Document Activities</title>
		<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body >

	<table width="100%">
		<tr>
			<td class="menusection-Logs" colspan=2>Analysis &gt; 
																						Transactions &gt; 
																						Document Details &gt;
																						Activity Log&nbsp;</td>
		</tr>

		<tr>
			<td valign="top">
				<ul>
<!--
					<li><a href="transactionAnalysis.dsp">Return to Transaction Analysis</a></li>
-->
					<li><a href="ViewDocDetail.dsp?docId=%value internalId%">Return to Document Details</a></li>
				</ul>
			</td>
		</tr>


		%invoke wm.tnweb.queryFlow:viewDocActivitiesPageFlow%
		<tr>
			<td>
				<table width="100%">
					<tr><td class="heading" colspan="5">Document Activity Log</td></tr>
					<tr>
						<td class="oddcol">Date</td>
						<td class="oddcol">Type</td>
						<td class="oddcol">Class</td>
						<td class="oddcol">Brief Message</td>
						<td class="oddcol">User</td>
					</tr>
					%loop events%
					<tr>
						<td class="evenrow-l">%value EntryTimestamp% &nbsp;</td>
						<td class="evenrow-l">%value EntryType% &nbsp;</td>
						<td class="evenrow-l">%value EntryClass% &nbsp;</td>
						<td class="evenrow-l">%value BriefMessage% &nbsp;</td>
						<td class="evenrow-l">%value B2BUser%&nbsp; &nbsp;</td>
					</tr>
					%endloop%
				</table>
			</td>
		</tr>
		%end invoke%

	</table>
	</body>
</html>
