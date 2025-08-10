function onCreatePost()
    setProperty('gf.alpha',0.001)
    
    setupShaders()
    setRGBFill()
    makeLuaSprite('hateYou','mario/IHY/Luigi_IHY_Background_Assets_ete_sech_v2',screenWidth/2 - 250,screenHeight/2 - 50)
    setObjectCamera('hateYou','other')
    scaleObject('hateYou',1.8,1.8)
    updateHitbox('hateYou')
    setProperty('hateYou.offset.x',0)
    setProperty('hateYou.offset.y',0)
    setProperty('hateYou.alpha',0.010)
    addLuaSprite('hateYou',true)

end
function onEvent(name,v1,v2)
    if name == 'Triggers Oh God No' then
        if v1 == '0' then
            callScript('scripts/cameraMoviment','setCamPos',{'middledadbfX','dadY','all'})
            callScript('scripts/cameraMoviment','setOffs',{0})
            doTweenZoom('gameOGNZoom','camGame',getProperty('defaultCamZoom')-0.15,stepCrochet*0.006,'sineOut')
            shaderFunction('doShaderTween',{{'boyfriendShader','dadShader'},'fade',0,1})
        elseif v1 == '2' then
            shaderFunction('doShaderTween',{{'boyfriendShader','dadShader'},'fade',1,1})
            cancelTween('gameOGNZoom')
            callScript('scripts/cameraMoviment','setCamPos',{nil,nil,'all'})
            callScript('scripts/cameraMoviment','setOffs',{50})
            doTweenZoom('gameZoom','camGame',getProperty('defaultCamZoom'),2,'cubeInOut')
        end
    elseif name == 'Change Character' then
        setRGBFill()
    end
end

function onBeatHit()
    if curBeat == 23 then
        doTweenZoom("test4", "camEst", 1, 3, 'cubeInOut')
        doTweenY("test5", "camEst.scroll", 0, 3, 'cubeInOut')
    end
end

function shaderFunction(func,vars)
    callScript('extra_scripts/createShader',func,vars)
end

function setupShaders()
    for i, characters in pairs({'boyfriend','dad'}) do
        shaderFunction('createShader',{characters..'Shader','ColorFillShader'})
        shaderFunction('runShaderOnSprite',{characters,characters..'Shader'})
    end
    setRGBFill()
end
function opponentStrums()
    for strums = 0,7 do
        if strums < 4 then
            if downscroll then
                noteTweenY('noteY'..strums,strums,getPropertyFromGroup('strumLineNotes',strums,'y') + screenHeight,0.5,'bounceOut')
            else
                noteTweenY('noteY'..strums,strums,getPropertyFromGroup('strumLineNotes',strums,'y') - screenHeight,0.5,'bounceOut')
            end
        else
            if not middlescroll then
                noteTweenX('noteX'..strums,strums,92 + (112 * (strums-4)),0.5,'cubeOut')
            end
        end
    end
end
function onSongStart()
    for strums = 0,7 do
        if strums < 4 then
            if not middlescroll then
                
                setPropertyFromGroup('strumLineNotes',strums,'x',732 + (112 * strums))
            end
            if downscroll then
                setPropertyFromGroup('strumLineNotes',strums,'y',getPropertyFromGroup('strumLineNotes',strums,'y') - screenHeight)
            else
                setPropertyFromGroup('strumLineNotes',strums,'y',getPropertyFromGroup('strumLineNotes',strums,'y') + screenHeight)
            end
        else
            if not middlescroll then

                setPropertyFromGroup('strumLineNotes',strums,'x',412 + (112 * (strums-4)))
            end
        end
    end
    if curStep > 1 then
        removeCutscene()
        startCountdown()
    end
    if curStep > 88 then
        opponentStrums()
    end
end

function onStepHit()
    if curStep == 88 then
        opponentStrums()
    end

end