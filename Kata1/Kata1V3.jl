using DataStructures

function fillDictionary(size)
    dictionary = OrderedDict{Int, Int}()
    i = 1
    while i <= size
        println("ingrese el valor: ", i)
        input = parse(Int, readline())
        if haskey(dictionary, input)
            dictionary[input] = dictionary[input] + 1
        else
            dictionary[input] = 1 
        end
        i = i+1
    end
    return dictionary
end

function codeArray(dictionary)
    result = dictionary.keys[1]
    i = 1
    while i <= length(dictionary.keys)
        if dictionary[dictionary.keys[i]] > 1
            if i == 1
                result = string(result,"*",dictionary[dictionary.keys[i]])
            else
                result = string(result,"..",dictionary.keys[i],"*",dictionary[dictionary.keys[i]])
            end
        else
            if i == length(dictionary.keys)
                result = string(result,"..",dictionary.keys[i])
            end
        end
        i = i+1
    end
    return result
end

function decodeString(codedString)
    elements = split(codedString, "..")
    decodedString = Int[]
    for (index, element) in enumerate(elements)
        if contains(element, "*")
            elementValues = split(element, "*")
            currentNumber = parse(Int,elementValues[1])
            multiplier = parse(Int, elementValues[2])
            i = 0
            while i < multiplier
                append!(decodedString, currentNumber)
                i = i+1
            end
        else
            currentNumber = parse(Int, element)
            append!(decodedString, currentNumber)
        end

        if index != length(elements)
            nextElement = elements[index+1]
            if contains(nextElement, "*")
                nextNumber = parse(Int,split(nextElement,"*")[1])
            else
                nextNumber = parse(Int, nextElement)
            end

            if nextNumber > currentNumber+1
                i = currentNumber+1
                while i < nextNumber
                    append!(decodedString, i)
                    i = i+1    
                end
                
            end
        end
    end
    return decodedString
end

println("Cuántos números tendrá el arreglo?")
size = parse(Int, readline())

valuesDictionary = fillDictionary(size)
codedString = codeArray(valuesDictionary)
decodedString = decodeString(codedString)
println("Arreglo codificado")
println(codedString)
println("Arreglo descodificado")
println(decodedString)