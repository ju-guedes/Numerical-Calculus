#=
Newton:
- Julia version: 1
- Author: Julia
- Date: 2022-11-21
=#

function choosePoint(f, fd2, a,b)
    if f(a) * fd2(a) > 0
        return a
    elseif f(b) * fd2(b) > 0
        return b
    else
        throw("neither a nor b satisfies the condition")
    end
end

function integrateNewt(f, fd, p, e)
    res = e + 1
    while res > e
        x = p - (f(p)/fd(p))
        res = abs(x - p)
        p = x
    end
    return p
end