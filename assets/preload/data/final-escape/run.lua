

ButtonHit = false
jumpable = false

function onUpdatePost()


if curStep == 464 and not gameOver then
ButtonHit = true
jumpable = true

end


if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') or (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') and jumpable == true and not gameOver and not getProperty('cpuControlled') and ButtonHit == true then
 
 Jump()
  

end







end




function Jump()
if ButtonHit == true then

doTweenY('bfjumpUp', 'boyfriend', 50, crochet / 1000, 'quadOut')

 jumpable = false

setProperty('legs.visible',false) 
setProperty('legJump.visible',true)

setProperty('legJump.angle',0)


playAnim('legJump', 'jump', true, false, 0)

runTimer('JumpCooldown', crochet / 500, 1)

playSound('jump', 0.5)


    end
end


function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	
	if tag == 'JumpCooldown' and not gameOver then
	
	jumpable = true
	
	end
	
	if tag == 'autoJump' and getProperty('cpuControlled') then
	Jump()
	end
	
	
	
end

function onTweenCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	
	if tag == 'bfjumpUp' and not gameOver then
	
	doTweenY('bfJumpDown', 'boyfriend', 250, crochet / 1000, 'quadIn')
	
	setProperty('legJump.visible',true)
	setProperty('legJump.angle',15)

	
	playAnim('legJump', 'fall', true, false, 0)
	
	
	
	end
	
	if tag == 'bfJumpDown' and not gameOver then
	
	setProperty('legs.visible',true) 
	
	setProperty('legJump.visible',false)
	
	
	
	end
end



gameOver = false

function onGameOver()

gameOver = true

jumpable = false

cancelTimer('JumpCooldown')


end