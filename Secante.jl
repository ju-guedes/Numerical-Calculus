#=
Secante:
- Julia version: 
- Author: Julia
- Date: 2022-11-21
=#

function integrateSec(f, fd, a, b, e)
    x = [0.0, 0.0]
    res, resF = e + 1, e + 1
    x[1] = a - (f(a)/(f(b) - f(a))) * (b - a)
    while res > e || resF > e
        c = f(a) * fd(a) > 0 ? a : b
        x[2] = x[1] - (f(x[1])/(f(x[1]) - f(c))) * (x[1] - c)
        res = abs(x[2] - x[1])
        resF = f(x[2])
        x[1] = x[2]
    end
    return x[2]
end