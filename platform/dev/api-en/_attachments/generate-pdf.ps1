# Retrieve the system date and format it
$DateToday = Get-Date -Format "d MMMM yyyy"
# Run Asciidoctore PDF passing the system date. Pipe to Out-Null to ensure that next command waits for completion.
asciidoctor-pdf -r asciidoctor-diagram ../pages/index.adoc -D . -a docdate=$DateToday -a company="edna" | Out-Null
# Open the PDF in Foxit PhantomPDF
& "C:\Program Files (x86)\Foxit Software\Foxit PhantomPDF\FoxitPhantomPDF.exe" "index.pdf"
