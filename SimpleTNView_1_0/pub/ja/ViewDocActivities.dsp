<html>

	<head>
		<title>ドキュメント状態遷移</title>
		<LINK REL="stylesheet" TYPE="text/css" HREF="webMethods.css">
		<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
	</head>

	<body >

	<table width="100%">
		<tr>
			<td class="menusection-Logs" colspan=2>TN検索結果 &gt; 
																						ドキュメント詳細 &gt; 
																						ドキュメント状態遷移ログ&nbsp;</td>
		</tr>

		<tr>
			<td valign="top">
				<ul>
<!--
					<li><a href="transactionAnalysis.dsp">Return to Transaction Analysis</a></li>
-->
					<li><a href="ViewDocDetail.dsp?docId=%value internalId%">ドキュメント詳細へ</a></li>
				</ul>
			</td>
		</tr>


		%invoke wm.tnweb.queryFlow:viewDocActivitiesPageFlow%
		<tr>
			<td>
				<table width="100%">
					<tr><td class="heading" colspan="5">ドキュメント状態遷移ログ</td></tr>
					<tr>
						<td class="oddcol">日付</td>
						<td class="oddcol">タイプ</td>
						<td class="oddcol">クラス</td>
						<td class="oddcol">詳細メッセージ</td>
						<td class="oddcol">ユーザ</td>
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
