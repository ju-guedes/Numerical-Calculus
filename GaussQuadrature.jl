#=
GaussQuadrature:
- Julia version: 1
- Author: Julia
- Date: 2022-11-20
=#

# coeficients ti and Ai

coef = [
[[0], [2]],
[[0.57735027, -0.57735027], [1, 1]],
[[0.77459667, 0, -0.77459667], [0.55555556, 0.88888889, 0.55555556]],
[[0.3399810436, 0.3399810436, -0.3399810436, -0.3399810436], [0.3478548451, 0.6521451549, 0.6521451549, 0.3478548451]],
[[0.9061798459, 0.5384693101, 0, -0.5384693101, -0.9061798459], [0.2369268850, 0.4786286705, 0.5688888889, 0.4786286705, 0.2369268850]]
]

# Calculate integral
function qGaussian(f, a, b, n)
    if a != -1 || b != 1
        g(x) = ((b-a)* x + a + b)/2
        return sum([coef[n][2][k] * (b-a)/2*(f∘g)(coef[n][1][k]) for k in 1:n])
    end
    return sum([coef[n][2][k] * f(coef[n][1][k]) for k in 1:n])
end

function errorT(fd, n)
    return ((2^(2*n + 1) * (factorial(n))^4)/((2*n + 1) * (factorial(2*n))^3)) * fd
end