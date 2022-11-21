#=
isolateRoot:
- Julia version: 1
- Author: Julia
- Date: 2022-11-20
=#

function bisect(f, a, b, e)
   # test bolzano
   res = e + 1
   x, p = [0.0, 0.0], [a,b]
   while res > e
       if f(a) > 0
           a,b = b,a
       end
       x[2] = (b + a)/2
       f(x[2]) > 0 ? b = x[2] : a = x[2]
       res = abs(x[1] - x[2])
       x[1] = x[2]
   end
   return x[2]
end
