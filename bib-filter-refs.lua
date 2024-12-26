function Div(elem)
    if (elem.identifier == "refs") then
        for _, div_entry in pairs(elem.content) do
            -- truncate citation key because pandoc prepends the string "ref-" to it
            identifier = string.sub(div_entry.identifier, 5)

            -- get file path for current bibliography item
            command = "papis list --file " .. identifier
            handle = io.popen(command)
            pdf_path = handle:read("*a")
            handle:close()
            pdf_path = pdf_path:gsub("\n", "")

            -- add a
            link = pandoc.Link("link", pdf_path, "link")
            link = pandoc.Strong(link)
            para = div_entry.content[1]
            
            for _, span in pairs(para.content) do
                if pandoc.List.includes(span.classes, "csl-right-inline", 1) then
                    table.insert(span.content, #span.content + 1, pandoc.Space())
                    table.insert(span.content, #span.content + 1, link)
                end
            end
        end
    end
    return elem
end
