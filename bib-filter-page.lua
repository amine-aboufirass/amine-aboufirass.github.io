-- all links inside citation objects need to be prepended by 
-- the relevant page, probably references.html
function Cite(elem)
    for key,value in pairs(elem.content) do
        if (value.t == "Link") then
            value.target = "./references.html" .. value.target
        end
    end
    return elem
end

-- Suppress bibliography from current page, suppressing using 
-- the CLI suppress option bypasses bibliographic cross 
-- referencing in pandoc filter
function Div(elem)
    if (elem.identifier) then
        return {}
    end

    return elem
end
