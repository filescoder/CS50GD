push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- [[ Initialize the game ]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more retro-looking fonr object we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 8)

    love.graphics.setFont(smallFont)

    -- initialize our virtual resolution, which will be rendered within
    -- our actual window no matter its dimensions
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

-- [[ Called after aupdate, used to draw anything to the screen ]]
function love.draw()
    push:apply('start')

    -- clear the screen with a specific color; in this case, a color similar
    -- to some versions of the original pong
    love.graphics.clear(40/255, 45/255, 52/255, 1)

    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    --render first paddle (left side)
    love.graphics.rectangle('fill', 10, 30, 5, 20)

    -- render second paddle (right side)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)

    -- render ball (center)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)

    push:apply('end')
end