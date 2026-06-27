local mainMod = "SUPER"
local EDGE = 20  -- Margin to apply snapping
local GAP_OUT = 15
local GAP_CENTER = 5

local function place(x, y, w, h)
    hl.dispatch(hl.dsp.window.resize({ x = math.floor(w), y = math.floor(h), relative = false }))
    hl.dispatch(hl.dsp.window.move({ x = math.floor(x), y = math.floor(y), relative = false }))
end

local CORNER = 250   -- franja desde arriba/abajo que cuenta como esquina

local function snap_on_release()
    local cur = hl.get_cursor_pos()
    local mon = hl.get_monitor_at_cursor()
    if cur == nil or mon == nil then return end

    local w = mon.width  / mon.scale
    local h = mon.height / mon.scale

    local near_left  = (cur.x - mon.x) <= EDGE
    local near_right = ((mon.x + w) - cur.x) <= EDGE
    if not (near_left or near_right) then return end

    -- Columna izquierda o derecha
    local col_x = near_left and (mon.x + GAP_OUT) or (mon.x + w / 2 + GAP_CENTER)
    local col_w = w / 2 - GAP_OUT - GAP_CENTER

    local rel_y = cur.y - mon.y   -- distancia desde el borde superior

    if rel_y <= CORNER then
        -- cuarto superior
        place(col_x, mon.y + GAP_OUT, col_w, h / 2 - GAP_OUT - GAP_CENTER)
    elseif (h - rel_y) <= CORNER then
        -- cuarto inferior
        place(col_x, mon.y + h / 2 + GAP_CENTER, col_w, h / 2 - GAP_OUT - GAP_CENTER)
    else
        -- media pantalla (franja central del borde)
        place(col_x, mon.y + GAP_OUT, col_w, h - 2 * GAP_OUT)
    end
end

hl.bind(mainMod .. " + mouse:274", snap_on_release, { mouse = true, release = true })
