$markdownFiles = ls *.md | select -expandproperty basename

foreach ($fileName in $markdownFiles)
{
    echo $fileName
    pandoc --template custom-html-template.html --from markdown --to html `
        -o "$fileName.html" -L include-code-files.lua -F pandoc-crossref  `
        -L include-files.lua -L diagram-generator.lua  -F pantable `
        --mathjax --metadata-file metadata-html.yaml `
        --extract-media ./svg "$fileName.md"
}

# Following command to generate a bibliography in main document
# pandoc -s --citeproc --bibliography references.json -t html -o  index.html --csl .\ieee.csl index.md

# Following command to generate a standalone bibliography
pandoc .\references.json -s --metadata title:References --citeproc -o references.html --csl ieee.csl -f csljson -t html