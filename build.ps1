$markdownFiles = ls *.md | select -expandproperty basename

foreach ($fileName in $markdownFiles)
{
    echo $fileName
    pandoc --template custom-html-template.html --from markdown --to html `
        -o "$fileName.html" -L include-code-files.lua -F pandoc-crossref  `
        -L include-files.lua -L diagram-generator.lua  -F pantable `
        --mathjax `
        --metadata-file metadata-html.yaml `
        --extract-media ./svg "$fileName.md"
}
    
