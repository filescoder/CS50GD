push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- [[ Initialize the game ]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

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

    love.graphics.printf(
        'Hello Pong!',
        0,
        VIRTUAL_HEIGHT / 2 - 6,
        VIRTUAL_WIDTH,
        'center'
    )

    push:apply('end')
end