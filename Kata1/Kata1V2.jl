using DataStructures

function fillDictionary(size)
    dictionary = OrderedDict{Int, Int}()
    
    i = 0
    # captura el número ingresado por el usuario y los va a agregando al diccionario
    while i < size
        println("Ingrese el número: ", i+1)
        number = parse(Int, readline())
        # Si encuentra la llave que es el número ingresado por el ususario, incrementa su valor
        # Si no encuentra la llave, la agrega con el valor de 1
        if haskey(dictionary, number)
            dictionary[number] = dictionary[number] + 1
        else
            dictionary[number] = 1
        end
        i = i+1
    end
    return dictionary
end

function codeDictionary(dictionary)
    result = dictionary.keys[1]
    i = 1
    while i <= length(dictionary.keys)
        if dictionary[dictionary.keys[i]] > 1
            if i == 1
                result = string(result,"*", dictionary[dictionary.keys[i]])
            else
                result = string(result,"..",dictionary.keys[i], "*", dictionary[dictionary.keys[i]])
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
            splittedElement = split(element, "*")
            currentNumber = parse(Int,splittedElement[1])
            multiplier = parse(Int,splittedElement[2])
            i = 0
            while i < multiplier
                append!(decodedString, currentNumber)
                i = i+1
            end
        else
            currentNumber = parse(Int,element)
            append!(decodedString, currentNumber)
        end

        if index != length(elements)
            nextElement = elements[index+1]
            if contains(nextElement, "*")
                nextNumber = parse(Int,split(nextElement, "*")[1])
            else
                nextNumber = parse(Int, nextElement)
            end
    
            if nextNumber > currentNumber+1
                i = currentNumber+1
                while i < nextNumber
                    append!(decodedString, i)
                    i = i + 1
                end
            end
        end
        

        
    end
    return decodedString
end

println("Cuántos números va a tener el arreglo?")
size = parse(Int, readline())

valuesDictionary = fillDictionary(size)
codedString = codeDictionary(valuesDictionary)
decodedString = decodeString(codedString)
println(valuesDictionary)
println(codedString)
println(decodedString)