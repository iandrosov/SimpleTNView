<html>
	<head>
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>Web Manager About Page</title>
		<link rel="stylesheet" type="text/css" href="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body class="main">
		<table width="100%" >
			<tr>
				<td class="menusection-Server" colspan=2>Web Manager &gt; About&nbsp;</td>
			</tr>

			<tr><td>&nbsp;</td></tr>

			<table>
				<tr>
					<td>
						<table>
							<!-- title bar -->
							<tr>
								<td class="heading" colspan=2>Software
								</td>
							</tr>
				
							<tr>
								<td class="oddrow">Product</td>
								<td class="oddrow-l">webMethods for Trading Networks</td>
							</tr>
							%invoke wm.tn:ping%
							<tr>
								<td class="evenrow">Version</td>
								<td class="evenrow-l">%value TNVersion%</td>
							</tr>
							<tr>
								<td class="oddrow">Build Number</td>
								<td class="oddrow-l">%value TNBuild%</td>
							</tr>
							<tr>
								<td class="evenrow">Integration Server Version</td>
								<td class="evenrow-l">%value B2BVersion%</td>
							</tr>
							<tr>
								<td class="oddrow">Maximum Partner Number</td>
								<td class="oddrow-l">%value MaxPartners%</td>
							</tr>
							<tr>
								<td class="evenrow">Server Locale</td>
								<td class="evenrow-l">%value ServerLocale%</td>
							</tr>
							%endinvoke%
							%invoke wm.tnweb.wrapper:logBrowserLocale%
							<tr>
								<td class="oddrow">Browser Locale</td>
								<td class="oddrow-l">%value browserLocale%</td>
							</tr>
							%endinvoke%
						</table>
					</td>
				</tr>
		</table>
	</body>
</html>
