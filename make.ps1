param($choice)

$toclean = "(.(ilg|ind|lof|out|snm|toc|nav|aux|bbl|blg|log|texbackup|out|idx|maf|mtc[\d]*)$)|~$"
$opts="--quiet"
$env:TEXINPUTS += ";.;content;include;figures;tables;"

switch ($choice) { 
    "clean" {
    	Get-ChildItem -Path "./" -Recurse | `
		Foreach-Object{
			if($_.Name -match $toclean){
				rm $_.FullName
			}
		}
   	} 

    default {
    	if($choice -eq $null){
			$choice="manuscrit"
		}

		xelatex $opts "$choice.tex"

		Get-ChildItem "./" -Filter *.aux | `
		Foreach-Object{
			bibtex $_.FullName
		}

		makeindex $choice

		xelatex $opts "$choice.tex"
		xelatex $opts "$choice.tex"
    }
}




