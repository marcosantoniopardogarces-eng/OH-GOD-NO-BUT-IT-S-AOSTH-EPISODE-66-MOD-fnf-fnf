function onEvent(name,v1,v2)
    if name == 'Add Subtitle' then
        if not luaTextExists('SubtitleEvent') then
            makeLuaText('SubtitleEvent',v1,screenWidth,0,screenHeight - 150)
            setTextSize('SubtitleEvent',30)
            setObjectCamera('SubtitleEvent','other')
            addLuaText('SubtitleEvent')
            setTextBorder('SubtitleEvent',1,'000000')
        end
        setTextString('SubtitleEvent',v1)
        if v2 ~= '' then
            local color = string.lower(v2)
            if color == 'green' then
                color = '00FF00'
            elseif color == 'red' then
                color = 'FF0000'
            elseif color == 'blue' then
                color = '0000FF'
            elseif color == 'yellow' then
                color = 'FFFF00'
            else
                color = string.gsub(v2,'0xFF','')
            end
            setProperty('SubtitleEvent.color',getColorFromHex(color))
        end
    end
end
