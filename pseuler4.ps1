# Project Euler - 3
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

$numberA = 999
$numberB = 999

function isPalindrome($number) {
    $str1 = [string]$number
    $str2 = [string]$number
    $str2 = $str2.ToCharArray()
    $str2 = $str2 -join ([array]::Reverse($str2))
    if ("$str1" -eq "$str2") { $true } 
    else { $false }
}

$results = @()

for ($a = $numberA; $a -gt 0; $a = $a - 1) {
    for ($b = $numberB; $b -gt 0; $b = $b - 1) {
        $val = $b * $a
        if (isPalindrome $val) {
            $results = $results + $val
        }
    }
}

$results = $results | Select-Object -Unique | Sort-Object -Descending
$results[0]