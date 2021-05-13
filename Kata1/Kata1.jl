using DataStructures

function getNumbers(size)
    numbers = Int[]
    i = 1
    while i <= size
        println("ingrese el número ", i)
        append!(numbers, parse(Int, readline()))
        i = i+1
    end
    return numbers
end

function fillDictionary(numbers)
    numbersSpawns = OrderedDict{Int, Int}()
    i = 1
    while i <= length(numbers)
        if haskey(numbersSpawns, numbers[i])
            numbersSpawns[numbers[i]] = numbersSpawns[numbers[i]] + 1 
        else
            numbersSpawns[numbers[i]] = 1
        end
        i = i+1
    end
    return numbersSpawns
end

function codeArray(numbersDictionary)
    result = numbersDictionary.keys[1]
    i = 1
    while i <= length(numbersDictionary.keys)
        if numbersDictionary[numbersDictionary.keys[i]] > 1
            if i == 1 
                result = string(numbersDictionary.keys[i], "*", numbersDictionary[numbersDictionary.keys[i]])
            else
                result = string(result, "..", numbersDictionary.keys[i], "*", numbersDictionary[numbersDictionary.keys[i]])
            end
           
        elseif i == length(numbersDictionary.keys)
            result = string(result, "..", numbersDictionary.keys[i]) 
        elseif i == 1
            result = string(numbersDictionary.keys[i]) 
        end
        i = i+1
    end
    return result
end

function decodeArray(codedString)
    elements = split(codedString, "..")
    numbers = Int[]
    for (index, element) in enumerate(elements)
        if contains(element, "*")
            currentElement = split(element, "*")
            currentNumber = parse(Int, currentElement[1])
            i = 1
            while i <= parse(Int, currentElement[2])
                append!(numbers, currentNumber)
                i = i + 1
            end
        else
            currentNumber = parse(Int,element)
            append!(numbers, currentNumber)
        end

        if index < length(elements)
            nextElement = elements[index+1]
        
            if contains(nextElement, "*")
                nextElement = split(nextElement, "*")
                nextNumber = parse(Int, nextElement[1])
            else
                nextNumber = parse(Int, nextElement)
            end

            if nextNumber > currentNumber+1
                i = currentNumber+1
                while i < nextNumber
                    append!(numbers, i) 
                    i = i+1
                end
            end
        end
        
    end
    return numbers
end


println("De cuántos números quiere el arreglo")
size = parse(Int, readline())

numbers = getNumbers(size)
numbersDictionary = fillDictionary(numbers)
codedString = codeArray(numbersDictionary)
decodedString = decodeArray(codedString)
println("El arreglo codificado es: ", codedString)
println("El arreglo descodificado es: ", decodedString)
