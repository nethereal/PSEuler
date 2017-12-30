# Project Euler - 5
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

function isValid ($numberToCheck) {
    $series = 1..20
    foreach ($number in $series) { if (($numberToCheck % $number) -gt 0) { return $false } }
    return $true
}

$current = 20
do { $current = $current + 20 } while ((isValid $current) -eq $false)
$current
