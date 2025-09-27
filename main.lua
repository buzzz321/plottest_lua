local delta = 0.0
function love.load()
    delta = 0
end

function love.update(dt)
    delta = dt
end

function love.draw()
    love.graphics.print(string.format("Hello World! dt = %3.3f", 1.0 / delta), 400, 300)
end
