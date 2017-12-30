# Project Euler - 6
# The sum of the squares of the first ten natural numbers is,
#  2    2           2
# 1  + 2  + ... + 10  = 385
# The square of the sum of the first ten natural numbers is,
#                   2
# (1 + 2 + ... + 10)  = 552 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

$inputArray = 1..100

function sumSquares ($inputNumbers) {
    $sum = 0
    foreach ($number in $inputNumbers) { $sum = $sum + ($number * $number) }
    return $sum
}

function squareSum ($inputNumbers) {
    $sum = 0
    $inputNumbers | % { $sum = $sum + $_ }
    $square = $sum * $sum
    return $square
}

$result = (squareSum -input $inputArray) - (sumSquares -input $inputArray)
$result
