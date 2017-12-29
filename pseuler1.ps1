﻿# Project Euler - 1
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

$upperlimit = 1000
$multiples = @(3,5)

$sb = {
    param($interval,$limit)
    for ($i = 0; $i -lt $limit; $i = $i + $interval) { $i }
}

$results,$res = $null
foreach ($multiple in $multiples) { $results += (& $sb $multiple $upperlimit) }
($results | select -Unique) | % { $result = $result + $_ } 
$result
