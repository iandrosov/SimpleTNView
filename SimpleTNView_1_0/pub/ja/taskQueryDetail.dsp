<html>

	<head>
		<title>Task Analysis Search Results</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body >

		<table width="100%" >
			<tr width="100%">
				<td class="menusection-Logs" colspan=2>Analysis &gt; Tasks &gt; Search Results&nbsp;</td>
			</tr>

			<tr>
				<td valign="top">
					<ul>
						<li><a href="taskQuery.dsp">Return to Task Analysis</a></li>
					</ul>
				</td>
			</tr>

			<tr>
				<td>
					<table>

						<!-- title bar -->
						<tr>
							<td class="heading" colspan=2>Search criteria</td>
						</tr>
						<tr>
							<td class="evenrow">From Date</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value FromDate%</td>
						</tr>
						<tr>
							<td class="evenrow">To Date</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value ToDate%</td>
						</tr>
						<tr>
							<td class="evenrow">Task Type</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value taskType%</td>
						</tr>
						<tr>
							<td class="evenrow">Task Status</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value taskStatus%</td>
						</tr>
						<tr>
							<td class="evenrow">Delivery Method</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value deliveryMethod%</td>
						</tr>
						<tr>
							<td class="evenrow">Receiver</td>
							<td class="evenrow-l">&nbsp;&nbsp;%value partnerName%</td>
						</tr>

		%invoke wm.tnweb.querySvc:runTaskQuery%
					<tr>
						<td class="evenrow">Tasks Retrieved</td>
						<td class="evenrow-l">&nbsp;&nbsp;%value resultCount%</td>
					</tr>

					</table>
				</td>
			</tr>

			<tr><td>&nbsp;</td></tr>

			<tr>
				<td>
					<table width="100%">
			
					%ifvar results%
						<tr><td class="heading" colspan="6">Tasks</td></tr>
						<tr>
							<td class="oddcol">Time Created</td>
							<td class="oddcol">Task Status</td>
							<td class="oddcol">Retries</td>
							<td class="oddcol">Retry Limit</td>
							<td class="oddcol">Delivery Method</td>
							<td class="oddcol">Task Type</td>
						</tr>
						%loop results%
						<tr>
							<td class="evenrow-l"><a href="ViewOneTaskPage.dsp?taskId=%value dj.JobID%">%value dj.TimeCreated%</a> &nbsp;</td>
							<td class="evenrow-l">%value dj.JobStatus% &nbsp;</td>
							<td class="evenrow-l">%value dj.Retries% &nbsp;</td>
							<td class="evenrow-l">%value dj.RetryLimit% &nbsp;</td>
							<td class="evenrow-l">%value dj.ServiceName% &nbsp;</td>
							<td class="evenrow-l">%value dj.JobType% &nbsp;</td>
						</tr>
						%endloop results%
					%endif results%
					</table>
					%endinvoke%
				</td>
			</tr>
		</table>
	</body>
</html>
