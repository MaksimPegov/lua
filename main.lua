-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Your code here
_G.game_art = require("majestyArt").new();
game_art:loadDecor();
game_art:loadDeltas();

local enemies = {};
local words = {"tom","cat","max","dog","math","fin"} --слова--


function getWord()
	local id = math.random(1,#words)
	return words[id];
end
for i = 1,5 do
	local mc = display.newGroup();
	--local body = display.newCircle(0,0,100);
	local untit = require("objUnit").new("goblin",1,1)
	mc:insert(untit);
	--mc:insert(body);
------------------------Удаляем круги------------[[
--	mc:addEventListener("tap",function(e)
--		mc:removeSelf();
--	end);
-------------------------------------
	W = display.contentWidth;
	H = display.contentHeight;
-----------------------Перемещаем круг------------
	--mc.x = math.random()*W;
	mc.y = math.random(1,5)*H/5 - H/10;
-----------------------Разноцветные круги---------
	--body:setFillColor(math.random(),math.random(),math.random());]]
	local word = getWord();
	local dtxt = display.newText(mc,word,0,0,nil,30);
	table.insert(enemies,mc)
--------------------------------------------------


end;

-----------движение гоблинов---------------
Runtime:addEventListener("enterFrame",function()
	for i = #enemies,1,-1 do
		local mc =enemies[i];
		mc.x = mc.x + 1;
	end;
end);
