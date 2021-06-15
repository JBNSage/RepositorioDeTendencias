import unittest
from rangeContainsSet import rangeContains

class Test_positive_cases(unittest.TestCase):
    def test_rangeContains_closed_range(test):
        numbersRange = "[1,5]"
        set = {1,3}
        test.assertTrue(rangeContains(numbersRange,set))

    def test_rangeContains_open_range(test):
        numbersRange = "(1,5)"
        set = {2,4}
        test.assertTrue(rangeContains(numbersRange,set))

class Test_negative_cases(unittest.TestCase):
    def test_rangeContains_not_in_range(test):
        numbersRange = "[1,5)"
        set = {1,5}
        test.assertFalse(rangeContains(numbersRange,set))

    def test_rangeContains_invalid_set(test):
        numbersRange = "(1,5)"
        set = {2, "a"}
        test.assertFalse(rangeContains(numbersRange,set))

unittest.main()