param ($filename)

papis export --all > library/references.bib

# Convert bibliography to UTF-8
Get-Content -Path "library/references.bib" | Set-Content -Path "references.bib" -Encoding UTF8

# build the main document(s), suppressing the bibliography but applying the filter
pandoc -d defaults.yaml -o "$filename.html" "$filename.md"

# build the bibliography, ensuring all entries are included regardless of whether 
# they are cited or not
pandoc -d defaults-bib.yaml -o references.html "blank.md"


