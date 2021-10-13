# Retrieve the line in index.adoc starting with :filenamestem:
$FileName = Get-Content ../pages/index.adoc | Where-Object { $_.Contains(":filenamestem:") }
# Trim off :filenamestem: from the start of the line
$FileName = $FileName.TrimStart(":filenamestem: ")
# Retrieve the system date and format it
$DateToday = Get-Date -Format "yyyy-MM-dd"
# Add todays's date and the file extension
$FileName = $FileName + $DateToday + ".pdf"
# Retrieve the system date again and format it for the front cover
$DateToday = Get-Date -Format "d MMMM yyyy"
# Run Asciidoctor PDF passing the system date, filename and company. Redirect stderr output to errors.txt. This also ensures that the script waits to open the PDF.
& asciidoctor-pdf -r asciidoctor-diagram ../pages/index.adoc -D . -o $FileName -a docdate=$DateToday -a company="dena" -a filename=$FileName -a compress 2>errors.txt
# Open the PDF in Foxit PhantomPDF
& "C:\Program Files (x86)\Foxit Software\Foxit PhantomPDF\FoxitPhantomPDF.exe" $FileName /A zoom=73%