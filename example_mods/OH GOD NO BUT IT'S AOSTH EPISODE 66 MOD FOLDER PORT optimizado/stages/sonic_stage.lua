function onCreate()
    --backgound shit
    makeLuaSprite('SKY','stages/SS/SKY',-630, -1190);
    addLuaSprite('SKY',false);
    scaleObject('SKY', 3.0,3.0);

    makeLuaSprite('Floor','stages/SS/Floor',-800, 150);
    addLuaSprite('Floor',false);
    scaleObject('Floor', 2.0,2.0);   

    makeLuaSprite('Rock','stages/SS/Rock',-330, 575);
    addLuaSprite('Rock',true);
    scaleObject('Rock', 1.0,1.0);

    makeLuaSprite('Cock','stages/SS/Cock',980, 386);
    addLuaSprite('Cock',false);
    scaleObject('Cock', 1.0,1.0);
end