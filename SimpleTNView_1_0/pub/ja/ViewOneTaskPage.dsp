<html>

	<head>
		<title>Task Details</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body>
		<table width="100%">
			<tr>
				<td class="menusection-Logs">Analysis &gt; Tasks &gt; Task Details
				</td>
			</tr>

			<tr>
				<td>
					<ul>
						<li><a href="taskQuery.dsp">Return to Task Analysis</a></li>
						<li><a href="javascript: history.back();">Return to Task Analysis Results</a></li>
					</ul>
				</td>
			</tr>

			<tr>
				<td>

		%invoke wm.tnweb.querySvc:taskQueryById%
			%loop results%
					<table>
						<tr><td class="heading" colspan="2">Tasks</td></tr>
						<tr>
							<td class="evenrow">Task ID</td>
							<td class="evenrow-l">&nbsp;%value dj.JobID%</td>
						</tr>
						<tr>
							<td class="evenrow">Task Type</td>
							<td class="evenrow-l">&nbsp;%value dj.JobType%</td>
						</tr>
						<tr>
							<td class="evenrow">Time Created</td>
							<td class="evenrow-l">&nbsp;%value dj.TimeCreated%</td>
						</tr>
						<tr>
							<td class="evenrow">Time Updated</td>
							<td class="evenrow-l">&nbsp;%value dj.TimeUpdated%</td>
						</tr>
						<tr>
							<td class="evenrow">Task Status</td>
							<td class="evenrow-l">&nbsp;%value dj.JobStatus%</td>
						</tr>
						<tr>
							<td class="evenrow">Delivery Method</td>
							<td class="evenrow-l">&nbsp;%value dj.ServiceName%</td>
						</tr>
						<tr>
							<td class="evenrow">Retry Limit</td>
							<td class="evenrow-l">&nbsp;%value dj.RetryLimit%</td>
						</tr>
						<tr>
							<td class="evenrow">Retry Factor</td>
							<td class="evenrow-l">&nbsp;%value dj.RetryFactor%</td>
						</tr>
						<tr>
							<td class="evenrow">Retries</td>
							<td class="evenrow-l">&nbsp;%value dj.Retries%</td>
						</tr>
						<tr>
							<td class="evenrow">Time to Wait</td>
							<td class="evenrow-l">&nbsp;%value dj.TimeToWait%</td>
						</tr>
						<tr>
							<td class="evenrow">Delivery Status</td>
							<td class="evenrow-l">&nbsp;%value dj.TransportStatus%</td>
						</tr>
						<tr>
							<td class="evenrow">Delivery Status Message</td>
							<td class="evenrow-l">&nbsp;%value dj.TransportStatusMessage%</td>
						</tr>
						<tr>
							<td class="evenrow">Transport Time</td>
							<td class="evenrow-l">&nbsp;%value dj.TransportTime%</td>
						</tr>
						<tr>
							<td class="evenrow">Server ID</td>
							<td class="evenrow-l">&nbsp;%value dj.ServerID%</td>
						</tr>
						<tr>
							<td class="evenrow">Queue Name</td>
							<td class="evenrow-l">&nbsp;%value dj.QueueName%</td>
						</tr>
						%endloop%
						<tr><td></td></tr>
					</table>
				</td>
			</tr>
		</table>
	%endinvoke%

	</body>
</html>
