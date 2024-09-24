function Cite(elem)
    -- elem is of type Cite
    -- elem.citations is a List of Citation objects
    -- elem.content is an Inlines object which  is a List of Inline elements
    print(elem)

    print("\nCITATIONS")
    for i, item in pairs(elem.citations) do
        print(i, item)
    end
    
    print("\nCONTENT")
    for i, item in pairs(elem.content) do
        print(i, item)
    end

end

