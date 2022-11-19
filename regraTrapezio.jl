#=
regraTrapezio:
- Julia version: 
- Author: Jeane
- Date: 2022-11-18
=#
getset(a, b, n) = [a + k * (abs(a - b)/n) for k in 0:n]
function integraTrapezioXF(set_x, f)
    l = length(set_x)
    h = abs(set_x[l] - set_x[1])/(l-1)
    set_y = zeros(l)
    for k in 1:l
        if k > 1 && k < l
            set_y[k] = 2 * f(set_x[k])
        else
            set_y[k] = f(set_x[k])
        end
    end
    return (h/2) * sum(set_y)
end

function integraTrapezioXY(x, y)
    l = length(x)
    h = abs(x[l] - x[1])/(l-1)
    for k in 1:l
        if k > 1 && k < l
            y[k] *= 2
        end
    end
    return (h/2) * sum(y)
end

function errorTrunc(fd2, a, b, n)
    yfd2 = [abs(fd2(a)), abs(fd2(b))]
    return  (-((b-a)^3)/(12 * n^2)) * max(yfd2...)
end
