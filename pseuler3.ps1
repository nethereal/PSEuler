# Project Euler - 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

$upperlimit = [uint64]600851475143
$result = $null

function Test-Prime {
    param(
        [Parameter(ValueFromPipeline=$true)]
        [uint64]$number
        )
    Process {
        $prime = $true;
        if ($number -eq 1) { $prime = $false; }
        if ($number -gt 3) {
            $sqrt = [math]::Sqrt($number); 
            for($i = 2; $i -le $sqrt; $i++) {
                if ($number % $i -eq 0) {
                    $prime = $false;
                    break;
                }
            }
        }
        return $prime;
    }
}
function Get-Factor ($a) {
    1..[Math]::Sqrt($a) `
        | Where-Object { $a % $_ -eq 0 } `
        | ForEach-Object { $_; $a / $_ } `
        | Sort-Object -Unique
}

(Get-Factor $upperlimit) | % { if (Test-Prime $_) { $result = $_ } }
$result