local delta = 0.0
local screen_width, screen_height = 0, 0
local fps = 0
local SINES = 10
local HIGHT = 25
local curves = {}
local readyToQuit = false

function print2dArray(arr)
    for row = 1, #arr do
        for col = 1, #arr[row] do
            io.write(arr[row][col] .. "\t")
        end
        io.write("\n")
    end
end

function love.load()
    delta = 0

    screen_width, screen_height = love.graphics.getDimensions()
    local success = love.window.setMode(screen_width, screen_height, { resizable = true })

    
end

function love.quit()
    if readyToQuit then
        print("Thanks for playing. Please play again soon!")
        return false
    end
end

function love.update(dt)
    screen_width, screen_height = love.graphics.getDimensions()
    delta = delta + 1

    if delta % 32 == 0 then
        fps = 1 / dt
    end

    local deltaY = screen_height / (HIGHT/2)
    --print(deltaY, screen_height)
    for n = 1, SINES do
        local row = {}
        for x = 1, screen_width do
           row[x] = HIGHT * math.sin((x - delta + n*4) * 2 * math.pi / 360.0) + deltaY * n
            curves[n] = row
        end
    end
    --print2dArray(curves)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setColor({ 255, 255, 255, 255 })
    love.graphics.print(string.format("Hello World! fps = %3.3f ", fps), 400, 300)

    -- for x = 1, screen_width - 1 do
    --     local y = 25 * math.sin((x - delta) * 2 * math.pi / 360.0) + screen_height / 2
    --     love.graphics.setColor({ 0, 0, 255, 255 })
    --     love.graphics.points({ x, y })
    -- end
    love.graphics.setColor({ 0, 0, 255, 255 })
    for n = 1, #curves do
       for x = 1, #curves[n] do
          love.graphics.points({ x, curves[n][x] })
       end
    end
end
