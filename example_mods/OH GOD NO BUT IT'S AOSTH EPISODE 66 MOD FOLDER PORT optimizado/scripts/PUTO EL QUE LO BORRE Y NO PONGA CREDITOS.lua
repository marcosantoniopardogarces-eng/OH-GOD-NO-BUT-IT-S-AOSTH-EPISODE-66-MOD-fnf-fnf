function onCreate()
  makeLuaText('ola', "MOD FOLDER PORTER POR TAUOMBC_SKR V2", 2600, 200, 685);
  setProperty('ola.alpha',1.0);
  setTextFont("ola", "5by7.ttf")
    setTextSize('ola',18);
    addLuaText('ola');
end

function onSongStart()

  doTweenX('Text', 'ola', -1150, 5, 'elasticInOut')
   setTextFont("5by7", "5by7.ttf")
function onTweenCompleted(tag)
if tag == 'Text' then
doTweenAlpha('Text', 'ola', 0.70, 0.7, 'lineal');
end
end

end

    