#=
Pegasus:
- Julia version: 1
- Author: Julia
- Date: 2022-11-21
=#

function integratePegasus(f, a, b, e)
    x = [a, b, 0.0]
    res = e + 1
    xy = [[x[1], f(x[1])], [x[2], f(x[2])], [x[3], f(x[3])]]
    while res > e
        x[3] = x[2] - (xy[2][2]*(x[2] - x[1])/xy[2][2] - xy[1][2])
        xy[3][2] = f(x[3])
        res = abs(x[3] - x[2])
        if xy[3][2] * xy[2][2] < 0
            x[1],x[2] = x[2], x[3]
            xy[1][1], xy[2][2] = f(x[1]), f(x[2])
        else
            xy[1][2] = (xy[1][2] * xy[2][2])/(xy[2][2] + xy[3][2])
            x[2],xy[2][2] = x[3], f(x[3])
        end
    end
    return x[3]
end