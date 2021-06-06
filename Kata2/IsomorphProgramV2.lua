function AreIsomorph(FirstWord, SecondWord)
    local mapping = {}
    local wordOcurrence = {}
    local i = 1
    local j = 1
    local isIsomorph = true

    if #FirstWord ~= #SecondWord then
        error("las palabras deben de ser de la misma longitud")
    else
        for letter in string.gmatch(FirstWord, ".") do
            if mapping[letter] ~= nil and mapping[letter] ~= string.sub(SecondWord, i, j) then
                isIsomorph = false
                wordOcurrence[letter] = wordOcurrence[letter] + 1
                mapping[wordOcurrence[letter].."-"..letter] = string.sub(SecondWord, i, j)
            elseif mapping[letter] == nil then
                mapping[letter] = string.sub(SecondWord, i, j)
                wordOcurrence[letter] = 1
            end
            i = i + 1
            j = j + 1  
        end
        return isIsomorph, mapping
    end
    
end

function Main()
    print("Ingrese la primera palabra")
    FirstWord = io.read()

    print("Ingrese la segunda palabra")
    SecondWord = io.read()

    IsIsomorph, Mapping = AreIsomorph(FirstWord, SecondWord)

    if IsIsomorph then
        print("Las palabras son isomorfas")
        for key, value in pairs(Mapping) do
            print(key.." => "..value)
        end
    else
        print("Las palabras no son isomorfas")
        for key, value in pairs(Mapping) do
            print(key.." => "..value)
        end
    end
end
