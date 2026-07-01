-- ============================================================
--  SNAW Wrapper Library
--  Usage: local snaw = loadstring(game:HttpGet("your_url"))()
-- ============================================================

local lib = {}

-- ============================================================
-- ENTITIES
-- ============================================================

-- Returns all alive entities (world pos, health, team, distance)
function lib.getAllEntities()
    return Snaw.entities.GetAll()
end

-- Returns all entities + pre-computed screen coords (screenX, screenY, onScreen)
function lib.getAllEntitiesWithScreen()
    return Snaw.entities.GetAllWithScreenData()
end

-- Fast FFI path: returns (pointer, count). Requires LuaJIT FFI.
function lib.getAllEntitiesFFI()
    return Snaw.entities.GetAllFFI()
end

-- Returns your own player: { name, health, maxHealth, posX, posY, posZ }
function lib.getLocalPlayer()
    return Snaw.entities.GetLocalPlayer()
end

-- ============================================================
-- TEAMS
-- ============================================================

-- Set a custom team classifier function. fn(entity) -> teamInfo | nil
function lib.setTeamClassifier(fn)
    Snaw.teams.setClassifier(fn)
end

-- Remove your classifier; revert to native detection
function lib.clearTeamClassifier()
    Snaw.teams.clearClassifier()
end

-- How often players are re-checked (seconds, default 3.0, min 0.05)
function lib.setTeamRefreshInterval(seconds)
    Snaw.teams.setRefreshInterval(seconds)
end

-- Force everyone to be re-evaluated next frame
function lib.invalidateTeams()
    Snaw.teams.invalidate()
end

-- ============================================================
-- DRAWING (2D)
-- ============================================================

-- Draw a 2D line on screen
function lib.drawLine(x1, y1, x2, y2, r, g, b, a, thickness)
    Snaw.draw.Line(x1, y1, x2, y2, r, g, b, a, thickness)
end

-- Draw text at a screen position
function lib.drawText(x, y, text, r, g, b, a)
    Snaw.draw.Text(x, y, text, r, g, b, a)
end

-- Draw a circle (filled optional)
function lib.drawCircle(x, y, radius, r, g, b, a, filled, thickness)
    Snaw.draw.Circle(x, y, radius, r, g, b, a, filled, thickness)
end

-- Draw a rectangle (filled optional)
function lib.drawBox(x1, y1, x2, y2, r, g, b, a, filled, thickness)
    Snaw.draw.Box(x1, y1, x2, y2, r, g, b, a, filled, thickness)
end

-- Draw a triangle (filled optional)
function lib.drawTriangle(x1, y1, x2, y2, x3, y3, r, g, b, a, filled)
    Snaw.draw.Triangle(x1, y1, x2, y2, x3, y3, r, g, b, a, filled)
end

-- Draw a rectangle with two-color gradient (vertical optional)
function lib.drawGradientRect(x1, y1, x2, y2, r1, g1, b1, a1, r2, g2, b2, a2, vertical)
    Snaw.draw.GradientRect(x1, y1, x2, y2, r1, g1, b1, a1, r2, g2, b2, a2, vertical)
end

-- Draw a rectangle with rounded corners (filled optional)
function lib.drawRoundedBox(x1, y1, x2, y2, r, g, b, a, rounding, filled)
    Snaw.draw.RoundedBox(x1, y1, x2, y2, r, g, b, a, rounding, filled)
end

-- Draw a health/progress bar. progress = 0.0-1.0
function lib.drawProgressBar(x, y, w, h, progress, bgR, bgG, bgB, bgA, fillR, fillG, fillB, fillA, rounding)
    Snaw.draw.ProgressBar(x, y, w, h, progress, bgR, bgG, bgB, bgA, fillR, fillG, fillB, fillA, rounding)
end

-- Measure text dimensions without drawing. Returns { width, height }
function lib.measureText(text)
    return Snaw.draw.TextSize(text)
end

-- ============================================================
-- DRAWING (3D world-space, auto-projected)
-- ============================================================

-- Wireframe 3D box in world space. pos/size/rot are Vector3
function lib.drawBox3D(pos, size, rot, r, g, b, a)
    Snaw.draw.Box3D(pos, size, rot, r, g, b, a)
end

-- Line between two world positions
function lib.drawLine3D(from, to, r, g, b, a)
    Snaw.draw.Line3D(from, to, r, g, b, a)
end

-- Flat ring/circle at a world position (good for range indicators)
function lib.drawCircle3D(pos, radius, r, g, b, a)
    Snaw.draw.Circle3D(pos, radius, r, g, b, a)
end

-- ============================================================
-- CAMERA
-- ============================================================

-- Camera world position as Vector3
function lib.getCameraPosition()
    return Snaw.camera.GetPosition()
end

-- Normalized direction the camera is pointing
function lib.getCameraDirection()
    return Snaw.camera.GetDirection()
end

-- Overlay screen width in pixels
function lib.getScreenWidth()
    return Snaw.camera.getScreenWidth()
end

-- Overlay screen height in pixels
function lib.getScreenHeight()
    return Snaw.camera.getScreenHeight()
end

-- Screen center as { x, y }
function lib.getScreenCenter()
    return Snaw.camera.getScreenCenter()
end

-- Camera field of view in degrees
function lib.getFOV()
    return Snaw.camera.getFOV()
end

-- Whether the camera is in third-person mode
function lib.isThirdPerson()
    return Snaw.camera.isThirdPerson()
end

-- ============================================================
-- INPUT
-- ============================================================

-- True if a key is currently held (VK code)
function lib.isKeyDown(vk)
    return Snaw.input.IsKeyDown(vk)
end

-- True only on the frame a key goes DOWN (edge detect)
function lib.isKeyPressed(vk)
    return Snaw.input.IsKeyPressed(vk)
end

-- True only on the frame a key goes UP (edge detect)
function lib.isKeyReleased(vk)
    return Snaw.input.IsKeyReleased(vk)
end

-- Mouse cursor position as { x, y }
function lib.getMousePosition()
    return Snaw.input.GetMousePosition()
end

-- Left mouse button held
function lib.isLeftMouseDown()
    return Snaw.input.IsLeftMouseDown()
end

-- Right mouse button held
function lib.isRightMouseDown()
    return Snaw.input.IsRightMouseDown()
end

-- Whether the overlay window has focus
function lib.isGameFocused()
    return Snaw.input.IsGameFocused()
end

-- Move mouse by relative delta. Returns boolean.
function lib.moveMouse(dx, dy)
    return Snaw.input.MoveMouse(dx, dy)
end

-- Set cursor to absolute position (Memory Aim only). Returns boolean.
function lib.setCursorPos(x, y)
    return Snaw.input.SetCursorPos(x, y)
end

-- Get current crosshair/cursor position as x, y
function lib.getCrosshairPos()
    return Snaw.input.GetCrosshairPos()
end

-- Name of the active aim device
function lib.getAimDevice()
    return Snaw.input.GetAimDevice()
end

-- Whether any aim device is connected
function lib.isAimDeviceConnected()
    return Snaw.input.IsAimDeviceConnected()
end

-- Perform a mouse click. button: 0=left, 1=right, 2=middle
function lib.mouseClick(button)
    return Snaw.input.MouseClick(button or 0)
end

-- ============================================================
-- ROBLOX INSTANCE TREE
-- ============================================================

-- Get the Workspace instance handle
function lib.getWorkspace()
    return Snaw.roblox.GetWorkspace()
end

-- All direct children of an instance
function lib.getChildren(instance)
    return Snaw.roblox.GetChildren(instance)
end

-- Find a direct child by Name
function lib.findChild(instance, name)
    return Snaw.roblox.FindFirstChild(instance, name)
end

-- Find a direct child by ClassName
function lib.findChildOfClass(instance, className)
    return Snaw.roblox.FindFirstChildOfClass(instance, className)
end

-- Read the Name property
function lib.getName(instance)
    return Snaw.roblox.GetName(instance)
end

-- Read the ClassName property
function lib.getClassName(instance)
    return Snaw.roblox.GetClassName(instance)
end

-- Quick validity check on an instance handle
function lib.isValid(instance)
    return Snaw.roblox.IsValid(instance)
end

-- World position of a BasePart, Model, or Attachment
function lib.getPosition(instance)
    return Snaw.roblox.GetPosition(instance)
end

-- Size of a BasePart as Vector3
function lib.getSize(instance)
    return Snaw.roblox.GetSize(instance)
end

-- Velocity of a BasePart in studs/sec
function lib.getVelocity(instance)
    return Snaw.roblox.GetVelocity(instance)
end

-- Parent of an instance
function lib.getParent(instance)
    return Snaw.roblox.GetParent(instance)
end

-- All descendants (optionally limited by maxDepth)
function lib.getDescendants(instance, maxDepth)
    return Snaw.roblox.GetDescendants(instance, maxDepth)
end

-- Read Health from a Humanoid
function lib.getHealth(humanoid)
    return Snaw.roblox.GetHealth(humanoid)
end

-- Read MaxHealth from a Humanoid
function lib.getMaxHealth(humanoid)
    return Snaw.roblox.GetMaxHealth(humanoid)
end

-- Read WalkSpeed from a Humanoid
function lib.getWalkSpeed(humanoid)
    return Snaw.roblox.GetWalkSpeed(humanoid)
end

-- Read HipHeight from a Humanoid
function lib.getHipHeight(humanoid)
    return Snaw.roblox.GetHipHeight(humanoid)
end

-- Rig type: 0=R6, 1=R15
function lib.getRigType(humanoid)
    return Snaw.roblox.GetRigType(humanoid)
end

-- Humanoid state (8=Running, 3=Jumping, 5=Freefall, etc.)
function lib.getHumanoidState(humanoid)
    return Snaw.roblox.GetHumanoidState(humanoid)
end

-- Full CFrame: { r00..r22, x, y, z }
function lib.getCFrame(instance)
    return Snaw.roblox.GetCFrame(instance)
end

-- Batch-read positions for multiple BaseParts (one DMA round trip)
function lib.batchGetPositions(parts)
    return Snaw.roblox.BatchReadPositions(parts)
end

-- Batch-read health/maxHealth for multiple Humanoids
function lib.batchGetHealth(humanoids)
    return Snaw.roblox.BatchReadHealth(humanoids)
end

-- Scan a folder for character-like Models. maxCount optional (default 200)
function lib.scanFolder(folder, maxCount)
    return Snaw.roblox.ScanFolder(folder, maxCount)
end

-- Start async folder scan. Poll with pollScanResults()
function lib.scanFolderAsync(folder, maxCount)
    return Snaw.roblox.ScanFolderAsync(folder, maxCount)
end

-- Poll async folder scan. Returns table when done, nil if still running
function lib.pollScanResults()
    return Snaw.roblox.PollScanResults()
end

-- Start async batch position read. Poll with pollPositions()
function lib.batchGetPositionsAsync(parts)
    return Snaw.roblox.BatchReadPositionsAsync(parts)
end

-- Poll async position results
function lib.pollPositions()
    return Snaw.roblox.PollPositions()
end

-- Start async batch health read. Poll with pollHealth()
function lib.batchGetHealthAsync(humanoids)
    return Snaw.roblox.BatchReadHealthAsync(humanoids)
end

-- Poll async health results
function lib.pollHealth()
    return Snaw.roblox.PollHealth()
end

-- Read a single attribute by name from an instance
function lib.getAttribute(instance, name)
    return Snaw.roblox.GetAttribute(instance, name)
end

-- Read all attributes from an instance as a key-value table
function lib.getAttributes(instance)
    return Snaw.roblox.GetAttributes(instance)
end

-- ============================================================
-- GUI (call these inside update() — immediate mode)
-- ============================================================

-- Open a window. Returns true if visible, nil if user closed it. Always call endWindow after.
function lib.beginWindow(title, open)
    return Snaw.gui.BeginWindow(title, open)
end

-- Close the current window. Always pair with beginWindow.
function lib.endWindow()
    Snaw.gui.EndWindow()
end

-- Button. Returns true on the frame it's clicked.
function lib.button(label)
    return Snaw.gui.Button(label)
end

-- Animated toggle switch. Pass current bool, returns new bool.
function lib.toggle(label, value)
    return Snaw.gui.Toggle(label, value)
end

-- Checkbox. Pass current bool, returns new bool.
function lib.checkbox(label, value)
    return Snaw.gui.Checkbox(label, value)
end

-- Float slider. Returns new value.
function lib.slider(label, value, min, max, fmt)
    return Snaw.gui.Slider(label, value, min, max, fmt)
end

-- Integer slider. Returns new value.
function lib.sliderInt(label, value, min, max)
    return Snaw.gui.SliderInt(label, value, min, max)
end

-- Text input field. Returns current string.
function lib.inputText(label, text, maxLen)
    return Snaw.gui.InputText(label, text, maxLen)
end

-- Integer input field. Returns new value.
function lib.inputInt(label, value)
    return Snaw.gui.InputInt(label, value)
end

-- Float input field. Returns new value.
function lib.inputFloat(label, value, fmt)
    return Snaw.gui.InputFloat(label, value, fmt)
end

-- Dropdown. index is 1-based. items is a string array. Returns new 1-based index.
function lib.combo(label, index, items)
    return Snaw.gui.Combo(label, index, items)
end

-- Color picker. Colors are 0.0-1.0. Returns r, g, b, a.
function lib.colorPicker(label, r, g, b, a)
    return Snaw.gui.ColorPicker(label, r, g, b, a)
end

-- Keybind capture. Returns updated VK code.
function lib.keybind(label, currentVK)
    return Snaw.gui.Keybind(label, currentVK)
end

-- Plain text label
function lib.label(text)
    Snaw.gui.Text(text)
end

-- Colored text (0.0-1.0 colors)
function lib.labelColored(text, r, g, b, a)
    Snaw.gui.TextColored(text, r, g, b, a)
end

-- Bold text
function lib.boldLabel(text)
    Snaw.gui.BoldText(text)
end

-- Horizontal separator line
function lib.separator()
    Snaw.gui.Separator()
end

-- Vertical whitespace
function lib.spacing()
    Snaw.gui.Spacing()
end

-- Place next widget on the same line
function lib.sameLine(offset)
    Snaw.gui.SameLine(offset)
end

-- Begin a card-style group with optional title
function lib.beginGroup(title)
    Snaw.gui.BeginGroup(title)
end

-- End the current group card
function lib.endGroup()
    Snaw.gui.EndGroup()
end

-- Tooltip shown when the previous widget is hovered
function lib.tooltip(text)
    Snaw.gui.Tooltip(text)
end

-- Set position for the next window (first-use only)
function lib.setWindowPos(x, y)
    Snaw.gui.SetNextWindowPos(x, y)
end

-- Set size for the next window (first-use only)
function lib.setWindowSize(w, h)
    Snaw.gui.SetNextWindowSize(w, h)
end

-- Get current window size as { width, height }
function lib.getWindowSize()
    return Snaw.gui.GetWindowSize()
end

-- Available content width inside the current window
function lib.getContentWidth()
    return Snaw.gui.GetContentWidth()
end

-- Increase indent level (optional pixel amount)
function lib.indent(amount)
    Snaw.gui.Indent(amount)
end

-- Decrease indent level
function lib.unindent(amount)
    Snaw.gui.Unindent(amount)
end

-- Set column layout (pass 1 to reset)
function lib.columns(count)
    Snaw.gui.Columns(count)
end

-- Move to the next column
function lib.nextColumn()
    Snaw.gui.NextColumn()
end

-- ============================================================
-- MATH
-- ============================================================

-- 3D distance. Accepts two Vector3s or six numbers.
function lib.distance(v1, v2, z1, v2b, y2, z2)
    if type(v1) == "table" then
        return Snaw.math.distance(v1, v2)
    else
        return Snaw.math.distance(v1, v2, z1, v2b, y2, z2)
    end
end

-- 2D screen-space distance
function lib.distance2d(x1, y1, x2, y2)
    return Snaw.math.distance2d(x1, y1, x2, y2)
end

-- Distance from local player to a world point
function lib.distanceFromLocal(x, y, z)
    return Snaw.math.distanceFromLocal(x, y, z)
end

-- Project a world point to screen pixels. Returns { x, y, onScreen }
function lib.worldToScreen(x, y, z)
    if type(x) == "table" then
        return Snaw.math.worldToScreen(x)
    else
        return Snaw.math.worldToScreen(x, y, z)
    end
end

-- Yaw and pitch from one point to another in degrees. Returns { yaw, pitch }
function lib.angleTo(from, to, z1, tx, ty, tz)
    if type(from) == "table" then
        return Snaw.math.angleTo(from, to)
    else
        return Snaw.math.angleTo(from, to, z1, tx, ty, tz)
    end
end

-- Normalized direction vector from one point to another
function lib.lookAt(from, to)
    return Snaw.math.lookAt(from, to)
end

-- Your world position as a Vector3 (cached, no DMA cost)
function lib.getLocalPosition()
    return Snaw.math.getLocalPosition()
end

-- Raw 4x4 view-projection matrix as 16 numbers (column-major)
function lib.getViewMatrix()
    return Snaw.math.getViewMatrix()
end

-- Lerp between two numbers or Vector3s
function lib.lerp(a, b, t)
    return Snaw.math.lerp(a, b, t)
end

-- Clamp a number between min and max
function lib.clamp(value, min, max)
    return Snaw.math.clamp(value, min, max)
end

-- Returns -1, 0, or 1
function lib.sign(value)
    return Snaw.math.sign(value)
end

function lib.round(value)  return Snaw.math.round(value)  end
function lib.floor(value)  return Snaw.math.floor(value)  end
function lib.ceil(value)   return Snaw.math.ceil(value)   end
function lib.abs(value)    return Snaw.math.abs(value)    end
function lib.sqrt(value)   return Snaw.math.sqrt(value)   end
function lib.pow(b, e)     return Snaw.math.pow(b, e)     end

-- ============================================================
-- COLOR
-- ============================================================

-- Pack RGBA (0-255) into a color integer
function lib.rgba(r, g, b, a)
    return Snaw.color.rgba(r, g, b, a)
end

-- Pack RGB (0-255) into a color integer (alpha=255)
function lib.rgb(r, g, b)
    return Snaw.color.rgb(r, g, b)
end

-- HSV to packed color. H=0-360, S/V=0-1
function lib.hsv(h, s, v)
    return Snaw.color.hsv(h, s, v)
end

-- Animated rainbow color. speed optional (default 1.0)
function lib.rainbow(speed)
    return Snaw.color.rainbow(speed)
end

-- Lerp between two packed colors. t: 0.0=c1, 1.0=c2
function lib.blendColors(c1, c2, t)
    return Snaw.color.blend(c1, c2, t)
end

-- Lighten a packed color toward white. amount 0-1
function lib.lightenColor(color, amount)
    return Snaw.color.lighten(color, amount)
end

-- Darken a packed color toward black. amount 0-1
function lib.darkenColor(color, amount)
    return Snaw.color.darken(color, amount)
end

-- Unpack a color integer to r, g, b, a
function lib.unpackColor(color)
    return Snaw.color.unpack(color)
end

-- ============================================================
-- GAME STATE
-- ============================================================

-- True if DMA attached AND game session active
function lib.isInGame()
    return Snaw.game.isInGame()
end

-- True if DMA device is connected to game process
function lib.isAttached()
    return Snaw.game.isAttached()
end

-- Number of tracked entities
function lib.getPlayerCount()
    return Snaw.game.getPlayerCount()
end

-- Monotonic frame counter (resets on script load)
function lib.getFrameNumber()
    return Snaw.game.getFrameNumber()
end

-- Current Roblox PlaceId
function lib.getPlaceId()
    return Snaw.game.getPlaceId()
end

-- Current Roblox UniverseId / GameId
function lib.getGameId()
    return Snaw.game.getGameId()
end

-- Teleport local player to world position. Returns boolean.
function lib.teleport(x, y, z)
    return Snaw.game.teleport(x, y, z)
end

-- ============================================================
-- TIME
-- ============================================================

-- Seconds since overlay started
function lib.getTime()
    return Snaw.time.getTime()
end

-- Time between last two frames (same as update(dt))
function lib.getDelta()
    return Snaw.time.getDelta()
end

-- Current overlay FPS
function lib.getFPS()
    return Snaw.time.getFPS()
end

-- Time in milliseconds
function lib.getMillis()
    return Snaw.time.getMillis()
end

-- High-precision timestamp in seconds (microsecond accuracy)
function lib.clock()
    return Snaw.time.clock()
end

-- Frame-rate-independent smoothing. speed 5-20 is a good range.
function lib.smoothLerp(current, target, speed)
    return Snaw.time.lerp(current, target, speed)
end

-- Hermite S-curve between edge0 and edge1. Returns 0.0-1.0
function lib.smoothstep(edge0, edge1, x)
    return Snaw.time.smoothstep(edge0, edge1, x)
end

-- Quadratic ease-in (starts slow, ends fast)
function lib.easeIn(t)
    return Snaw.time.easeIn(t)
end

-- Quadratic ease-out (starts fast, ends slow)
function lib.easeOut(t)
    return Snaw.time.easeOut(t)
end

-- Slow on both ends, fast in the middle
function lib.easeInOut(t)
    return Snaw.time.easeInOut(t)
end

-- Blocking sleep. Freezes overlay. Max 10 seconds.
function lib.sleep(seconds)
    Snaw.time.sleep(seconds)
end

-- ============================================================
-- MEMORY (raw DMA read/write)
-- ============================================================

function lib.readFloat(address)         return Snaw.memory.readFloat(address)          end
function lib.readInt(address)           return Snaw.memory.readInt(address)            end
function lib.readPointer(address)       return Snaw.memory.readPointer(address)        end
function lib.readString(address, max)   return Snaw.memory.readString(address, max)    end
function lib.readBool(address)          return Snaw.memory.readBool(address)           end
function lib.readVector3(address)       return Snaw.memory.readVector3(address)        end

-- Follow a pointer chain. offsets is a table of integers.
function lib.followPointerChain(base, offsets)
    return Snaw.memory.followPointerChain(base, offsets)
end

-- Is this address in valid usermode range?
function lib.isValidAddress(address)
    return Snaw.memory.isValidAddress(address)
end

-- Is DMA attached to a game process?
function lib.isDMAConnected()
    return Snaw.memory.isConnected()
end

-- Game module base address
function lib.getBaseAddress()
    return Snaw.memory.getBaseAddress()
end

-- Add an offset to an address (can be negative)
function lib.addOffset(address, offset)
    return Snaw.memory.addOffset(address, offset)
end

function lib.writeFloat(address, value)         return Snaw.memory.writeFloat(address, value)   end
function lib.writeInt(address, value)           return Snaw.memory.writeInt(address, value)     end
function lib.writeBool(address, value)          return Snaw.memory.writeBool(address, value)    end
function lib.writeVector3(address, vec)         return Snaw.memory.writeVector3(address, vec)   end
function lib.writeBytes(address, bytes)         return Snaw.memory.writeBytes(address, bytes)   end

-- ============================================================
-- VECTOR3 HELPERS
-- ============================================================

-- Create a Vector3. Also has .Magnitude and .Unit set on creation.
function lib.vec3(x, y, z)
    return Vector3.new(x, y, z)
end

-- ============================================================
-- Return the library
-- ============================================================
return lib
