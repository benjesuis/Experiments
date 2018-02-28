function percentError(mV, aV)
    dif = abs(mV - aV)
    return (dif / aV) * 100
end

# INFINITE SERIES

function leibniz(len)
    runsum = 0
    scalar = 1;
    for i in 1:2:len
        runsum = runsum + scalar * (1 / i)
        scalar = scalar * -1
    end
    return runsum * 4
end

function newton(len)
    #max len = 62
    runsum = 0.5;
    num = 0;
    den = 0;
    for i in 1:2:len
        num = prod(i:-2:1) / 2 ^ i;
        den = (prod((i + 1):-2:1) / 2 ^ i) * (i + 2) * 2 ^ (i + 2)
        runsum = runsum + (num / den)
    end
    return runsum * 6
end

function basel(len)
    runsum = 0
    for i in 1:len
        runsum = runsum + (1 / i) ^ 2
    end
    return sqrt(runsum * 6)
end

# MANDELBROT SET

function mandelbrot(c, z)
    #must pass in both arguments
    #0.2500000001 -> 314157
    if z == nothing
        z = 0
    end
    counter = 0;
    while (z < 2)
        newz = z ^ 2 + c
        counter = counter + 1
        if (newz < 0.001)
            counter = -1
            break
        else
            z = newz
        end
    end
    while counter > 10
        counter /= 10
    end
    return counter
end

# ANALYZE

pies = [
        leibniz(50),
        newton(50),
        basel(50),
        mandelbrot(0.2500000001, nothing)
    ]

errors = zeros(Float64, 4)

for i in 1:length(pies)
    errors[i] += percentError(pies[i], pi)
    println("Pi calculated as ", pies[i], " has error ", errors[i], "%")
end
