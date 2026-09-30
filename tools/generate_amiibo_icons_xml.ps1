param(
	[string]$ManifestJson = "$env:TEMP\amiibo_icon_manifest.json",
	[string]$OutXml = "E:\Garmin Fenix\resources\drawables\amiibo_icons.xml"
)

$manifest = Get-Content $ManifestJson -Raw | ConvertFrom-Json

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('<drawables>')
foreach ($m in $manifest) {
	[void]$sb.AppendLine("    <bitmap id=`"$($m.ResourceId)`" filename=`"amiibo_icons/$($m.IconFile)`"/>")
}
[void]$sb.AppendLine('</drawables>')
[System.IO.File]::WriteAllText($OutXml, $sb.ToString(), (New-Object System.Text.UTF8Encoding $false))
Write-Output "Generated $OutXml with $($manifest.Count) bitmap entries"
