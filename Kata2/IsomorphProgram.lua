function AreIsomorph(FirstWord, SecondWord)
    local mapping = {}
    local isIsomorph = true
    local i = 1
    local j = 1
    if #FirstWord ~= #SecondWord then
        error("las palabras deben de ser de la misma longitud")
    else 
        for letter in string.gmatch(FirstWord, ".") do
            if mapping[letter] ~= nil and mapping[letter] ~= string.sub(SecondWord, i, j) then
                isIsomorph = false
                return isIsomorph
            elseif mapping[letter] == nil then
                mapping[letter] = string.sub(SecondWord, i, j)             
            end
            i = i+1
            j = j+1
        end
        return isIsomorph, mapping
    end
   

end

function Main()
    print("ingrese la primera palabra")
    FirstWord = io.read()
    
    print("ingrese la segunda palabra")
    SecondWord = io.read()
    
    IsIsomorph, Mapping = AreIsomorph(FirstWord, SecondWord)
    
    if IsIsomorph then
        print("las palabras son isomorfas")
        for key, value in pairs(Mapping) do
            print(key.." => "..value)
        end
    else
        print("las palabras no son isomorfas")
    end
      
end
