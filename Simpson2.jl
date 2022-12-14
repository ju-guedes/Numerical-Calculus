#=
Simpson2:
- Julia version: 2
- Author: Julia
- Date: 2022-11-18
=#

# Get the domain, given the limits os interval and number of partitions
getsetx(a, b, n) = [a + k * (abs(a - b)/n) for k in 0:n]

#  when we know the function
function integrateSimp1F(f, a, b, n = 1)
    setx = getsetx(a, b, n)
    sety = zeros(n + 1)
    for k in 1:n + 1
        if k > 1 && k < n + 1
            sety[k] = k % 3 == 1 ? 2 * f(setx[k]) : 3 * f(setx[k])
        else
            sety[k] = f(setx[k])
        end
    end
    return (3 * abs(a - b)/(8 * n)) * sum(sety)
end

# when we just have the set of y values
function integrateSimp1Y(y, a, b, n = 1)
    setx = getsetx(a, b, n)
    for k in 1:n + 1
        if k > 1 && k < n + 1
            y[k] = k % 3 == 1 ? 2 * y[k] : 3 * y[k]
        end
    end
    return (3 * abs(a - b)/(8 * n)) * sum(y)
end

# Error function
function errorT(df4, a, b, n)
    yd = [abs(df4(a)), abs(df4(b))]
    return -(abs(b - a)^5)/(80 * n^4) * max(yd...)
end