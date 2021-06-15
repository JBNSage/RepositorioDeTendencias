def rangeContains(numbersRange, numbersSet):
    splittedRange = numbersRange.split(',')
    rangeLimits = []
    for rangeIndicator in splittedRange:
        if "(" in rangeIndicator:
            numberLimit = int(rangeIndicator.strip("(")) + 1
            rangeLimits.append(numberLimit)
        elif ")" in rangeIndicator:
            numberLimit = int(rangeIndicator.strip(")")) - 1
            rangeLimits.append(numberLimit)
        else:
            numberLimit = int(rangeIndicator.strip("[]"))
            rangeLimits.append(numberLimit)
    
    for value in numbersSet:
        if type(value) != int:
            return False
        if value < rangeLimits[0] or value > rangeLimits[1]:
            return False

    return True