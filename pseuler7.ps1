# Project Euler - 7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10 001st prime number?
# Note: I've opted to use a function which leverages the sieve of Eratosthenes method.

$primetoget = 10001

function getPrimes ($limit) {
    $primesbool = @(1) * $limit
    $primes = @()
    for ($i = 2; $i -lt $limit; $i++) { if ($primesbool[$i]) { for ($j = $i; ($i * $j) -lt $limit; $j++) { $primesbool[$i * $j] = 0 } } }
    for ($i = $limit; $i -gt 1; $i--) { if ($primesbool[$i]) { $primes = $primes + $i } }
    $primesbool = $null
    return $primes 
}

$step = 0
do {
    $results = $null
    $step = $step + $primetoget
    $results = getPrimes -limit $step
} until ($results.count -gt $primetoget)
[array]::Reverse($results)
$results[$primetoget-1]
