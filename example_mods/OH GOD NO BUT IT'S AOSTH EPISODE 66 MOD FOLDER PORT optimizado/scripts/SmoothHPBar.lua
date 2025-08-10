--[[
	CREDITS:
		- Smooth Hp But Better By:
			Unholywanderer04#1468
		- Rest Of The Script By:
			OhMyMisty!#3867
]]

local health = 1
local percent = 1
local HPSmooth = 1
function onUpdatePost(elapsed)
	if getProperty('health') < 2 then
		health = math.lerp(health, getProperty('health'), math.boundTo(elapsed * 20, 0, 1))
	else
		health = 2
	end

	setProperty('healthBar.numDivisions', 10000)
	HPSmooth = math.lerp(HPSmooth, getProperty('health') * 50, elapsed * 20)
	setProperty('healthBar.percent', HPSmooth)

	percent = 1-(health/2)
	setProperty('iconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	setProperty('iconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)


	if settings.VerticalBar then
		setProperty('healthBar.angle', 90)
		setProperty('healthBar.x', -220)
		setProperty('healthBar.y', 360)
		setProperty('iconP2.x', getProperty('healthBar.x') + 220)
		setProperty('iconP1.x', getProperty('healthBar.x') + 220)

		if settings.FlipBar then
			setProperty('healthBar.flipX', true)

			setProperty('iconP2.y', 395 + getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)

			setProperty('iconP1.y', 205 + getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		else
			setProperty('healthBar.flipX', false)

			setProperty('iconP2.y', 305 + getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)

			setProperty('iconP1.y', 295 + getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		end
	end

	if not settings.VerticalBar and not settings.FlipBar then
		setProperty('iconP1.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
		setProperty('iconP2.x', getProperty('healthBar.x') + (getProperty('healthBar.width') * percent) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		setProperty('healthBar.flipX', false)
		setProperty('healthBar.angle', 0)
	end
end


function math.lerp(a, b, ratio) 
    return a + ratio * (b - a) 
end

function math.boundTo(value,min,max)
    local newValue = value
    if newValue < min then
        newValue = min
    elseif newValue > max then
        newValue = max
    end
    return newValue
end