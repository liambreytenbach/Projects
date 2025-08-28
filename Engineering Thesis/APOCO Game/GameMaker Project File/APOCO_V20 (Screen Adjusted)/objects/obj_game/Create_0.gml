// On game start
gml_pragma("global", "global.level = 0");
gml_pragma("global", "global.lives = 4");
gml_pragma("global", "global.levelComplete = false");
//gml_pragma("global", "global.enter_count = 0");
global.lives = 4;
global.score = 0;
global.currentScore = 0;
//global.coins = 0;
//global.diamonds = 0;

global.start_X = 0;
global.start_Y = 200;
global.end_X = 2000;
global.bestX = 0;

global.caveProb = 10;
coinBlockNumber = 0;
lifeBlockNumber = 0;
jumpBlockNumber = 0;

global.is_paused = false;
global.tutCompleted = false;

global.subLevel = 0;





draw_set_font(fnt_gameFont);

var seed = random(200000);

loading_frame = 0;

// Remove mouse
window_set_cursor(cr_none);

h = 0;
flatCount = 0;

// Skins
// Weapons




////////// Generating Game Terrain

// Sets the ground lower 
//var y_offset = 100;
	
	
// Size of the tiles that have been created as objects
//var blockSize = 16;

// Step change between blocks
//var amplitude = 100;

// Ratio of flat to change of height out of 10
//var flatScale = 7;


// Function used to clear blocks from terrain
function instanceClear(X1, X2, Y1, Y2) {
	for (i = X1-2; i <= X2; i+= 16) {
		for (k = Y1; k <= Y2+16; k+= 15) {
			position_destroy(i, k);
		}
	}
}


// Terrain Structure and calling functions for features
function generateTerrain(startX, endX, y_offset, amplitude, flatScale, blockSize, Depth, Seed){
	
	instance_create_layer(x - 300, y, 0, obj_bestX);
	
	if (global.levelComplete == false) {
		// Clouds 
		generateClouds(startX, endX);
	
		//////// TUTORIAL //////////////////////////////////////////////////////
		if (global.level == 0) {
			
			//instance_create_layer(200, 100, 0, obj_komodo);
		    for (X = startX; X < endX + 300; X += blockSize) {
			
				// beginHeight is used to determine where the first block will start
				var beginHeight = amplitude/2 * blockSize;
				// total height of the blocks in a vertical row
				var totalHeight = Depth + beginHeight;
			
				for (Y = 100 + y_offset; Y <= totalHeight + beginHeight + y_offset; Y+= blockSize) {
					// On surface
					if(Y == beginHeight+y_offset) {
						generateWaterTut(200, Y);
						generateStairsUp(X, Y);
						generateStairsDown(X, Y);
						generateCoins(X, Y);
					
					}
					else if Y <= totalHeight + y_offset -800  { // depth of soil to rock ration ( -10 is thicker than -40)
					
						if instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_wall) == noone {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
						
							// Grass
							if (instance_position(X, Y-16, obj_wall) == noone) {
								var wall = instance_create_layer(X, Y, 0, obj_wall);
								wall.sprite_index = spr_wall;
								var block = instance_create_layer(X, Y, 1, obj_block);
								block.sprite_index = spr_dirt_surface;
							}
						
							else {
								block.sprite_index = spr_dirt;
							}
						}
					}
					else {
						if (instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_water_outline) == noone) {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
							block.sprite_index = spr_stone;
						
						}
					}
			
					if (instance_position(X, Y, obj_water) != noone && instance_position(X, Y, obj_block) != noone) {
						instanceClear(X, X+1, Y, Y+1);
					}
				
				
			
				}	
			}
			
			//Stone Wall
			////////////////////////
			var wall = instance_create_layer(0, beginHeight+y_offset+44, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset+44, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset+28, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset+28, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset+12, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset+12, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-4, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-4, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-4, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-4, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-20, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-20, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-36, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-36, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-52, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-52, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-68, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-68, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-84, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-84, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-100, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-100, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-116, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-116, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-132, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-132, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(0, beginHeight+y_offset-148, 0, obj_wall);
			var block = instance_create_layer(0, beginHeight+y_offset-148, 1, obj_block);
			block.sprite_index = spr_stone;
			
			var wall = instance_create_layer(16, beginHeight+y_offset+44, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset+44, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset+28, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset+28, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset+12, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset+12, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-4, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-4, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-4, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-4, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-20, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-20, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-36, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-36, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-52, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-52, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-68, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-68, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-84, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-84, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-100, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-100, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-116, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-116, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-132, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-132, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(16, beginHeight+y_offset-148, 0, obj_wall);
			var block = instance_create_layer(16, beginHeight+y_offset-148, 1, obj_block);
			block.sprite_index = spr_stone;
			
			var wall = instance_create_layer(-64, beginHeight+y_offset-28, 0, obj_water);
			
			
			
			//Stone Jumps
			////////////////////////
			var wall = instance_create_layer(20*16, beginHeight+y_offset+44, 0, obj_wall);
			var block = instance_create_layer(20*16, beginHeight+y_offset+44, 1, obj_block);
			block.sprite_index = spr_stone;
		
			var wall = instance_create_layer(25*16, beginHeight+y_offset+44, 0, obj_wall);
			var block = instance_create_layer(25*16, beginHeight+y_offset+44, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(25*16, beginHeight+y_offset+28, 0, obj_wall);
			var block = instance_create_layer(25*16, beginHeight+y_offset+28, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(25*16, beginHeight+y_offset+12, 0, obj_wall);
			var block = instance_create_layer(25*16, beginHeight+y_offset+12, 1, obj_block);
			block.sprite_index = spr_stone;
			var wall = instance_create_layer(25*16, beginHeight+y_offset-4, 0, obj_wall);
			var block = instance_create_layer(25*16, beginHeight+y_offset-4, 1, obj_block);
			block.sprite_index = spr_stone;
		
			//////////////////
		
			// Water
			generateWaterTut(30*16, beginHeight+y_offset+60);
		
			// Caves
			generateCavesTut(60*16, 350);
			// Outline for cave
			generateCaveOutline(50*16, 80*16, y_offset + 140, Depth);
		
			// Moveable blocks
			var mblock = instance_create_layer(70*16, beginHeight+y_offset+44, 1, obj_Moveable_Block);
			mblock.sprite_index = spr_plank;
			
			
			//Hole for block
			position_destroy(80*16, beginHeight+y_offset+60);
			position_destroy(81*16, beginHeight+y_offset+60);
			
			
			//Enemy
			var enemy = instance_create_layer(90*16, beginHeight, 1, obj_tutMushroom);
		
		
			//Level End
			var endFlag = instance_create_layer(100*16, beginHeight +y_offset+60, 0,obj_tut_flag);
			endFlag.sprite_index = spr_checkPoint_down;
		
		
		}
		//////////////////////////////////////////////////////////////////////////////////
	
		//////// JUNGLE //////////////////////////////////////////////////////
		if (global.level == 1) {
			// Used to limit noise 
			var count = 0;
	
	
			// beginHeight is used to determine where the first block will start
			var beginHeight = round(random(amplitude)) * blockSize;
	
			// X for loop, goes from 0 to ...
			for (X = startX; X < endX; X += blockSize) {
		
				// 70% of the time the ground will be flat if 7
				if(count < flatScale) {
					count = random(10);
					flatCount += 1;
				}
				else {
					beginHeight = round(random(amplitude)) * blockSize;
					count = random(10);
					flatCount = 0;
				}
			
		
				// total height of the blocks in a vertical row
				var totalHeight = Depth + beginHeight;
		
				global.start_Y = beginHeight + y_offset;
		
				// Y for loop, does the vertical placement of blocks
				for (Y = beginHeight + y_offset; Y <= totalHeight + beginHeight + y_offset; Y+= blockSize) {
					// On surface
					if(Y == beginHeight+y_offset) {
						generateWater(X, Y);
						generateStairsUp(X, Y);
						generateStairsDown(X, Y);
						generateCoins(X, Y);
						generateLives(X, Y);
						generateJumps(X, Y);
					
						if (flatCount >= 5) {
							generateTraps(X, Y);
							flatCount = 0;
						}
					}
					else if Y <= totalHeight + y_offset -800  { // depth of soil to rock ration ( -10 is thicker than -40)
						if instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_wall) == noone {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
					
							// Grass
							if (instance_position(X, Y-16, obj_wall) == noone) {
								var wall = instance_create_layer(X, Y, 0, obj_wall);
								wall.sprite_index = spr_wall;
								var block = instance_create_layer(X, Y, 1, obj_block);
								block.sprite_index = spr_dirt_surface;
							}
						
							else {
								block.sprite_index = spr_dirt;
							}
						}
					}
					else {
						if (instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_water_outline) == noone) {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
							block.sprite_index = spr_stone;
							if(random(10000)<25 && Y < 500) {
								generateCaves(X, Y, y_offset+152, Depth);	
							}
						}
					}
			
					if (instance_position(X, Y, obj_water) != noone && instance_position(X, Y, obj_block) != noone) {
						instanceClear(X, X+1, Y, Y+1);
					}
			
				}
		
			}
	
			// Outline for cave
			//generateCaveOutline(startX, endX, y_offset + 152, Depth);
	
			// Fall away Sand
			//generateFallAwaySand(endX, y_offset);
	
			// Moveable Blocks
			generateMoveableBlocks(endX, 10);
		
		}
		//////////////////////////////////////////////////////////////////////////////////
	
		////////// DESERT ///////////////////////////////////////////////////////////////////
		else if (global.level == 2) {
			// Used to limit noise 
			var count = 0;
	
	
			// beginHeight is used to determine where the first block will start
			var beginHeight = round(random(amplitude)) * blockSize;
	
			// X for loop, goes from 0 to ...
			for (X = startX; X < endX; X += blockSize) {
		
				// 70% of the time the ground will be flat if 7
				if(count < flatScale) {
					count = random(10);
					flatCount += 1;
				}
				else {
					beginHeight = round(random(amplitude)) * blockSize;
					count = random(10);
					flatCount = 0;
				}
		
				// total height of the blocks in a vertical row
				var totalHeight = Depth + beginHeight;
		
				global.start_Y = beginHeight + y_offset;
		
				// Y for loop, does the vertical placement of blocks
				for (Y = beginHeight + y_offset; Y <= totalHeight + beginHeight + y_offset; Y+= blockSize) {
					// On surface
					if(Y == beginHeight+y_offset) {
						generateWater(X, Y);
						generateStairsUp(X, Y);
						generateStairsDown(X, Y);
						generateCoins(X, Y);
						generateLives(X, Y);
						generateJumps(X, Y);
					
						if (flatCount >= 3) {
							generateTraps(X, Y);
							flatCount = 0;
						}
					}
					else if Y <= totalHeight + y_offset -800  { // depth of soil to rock ration ( -10 is thicker than -40)
						if instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_wall) == noone {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
					
							// Grass
							if (instance_position(X, Y-16, obj_wall) == noone) {
								var wall = instance_create_layer(X, Y, 0, obj_wall);
								wall.sprite_index = spr_wall;
								var block = instance_create_layer(X, Y, 1, obj_block);
								block.sprite_index = spr_desertSand_surface;
							}
						
							else {
								block.sprite_index = spr_desertSand;
							}
						}
					}
					else {
						if (instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_water_outline) == noone) {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
							block.sprite_index = spr_stone;
							if(random(10000)<25 && Y < 500) {
								//generateCaves(X, Y);	
							}
						}
					}
			
					if (instance_position(X, Y, obj_water) != noone && instance_position(X, Y, obj_block) != noone) {
						instanceClear(X, X+1, Y, Y+1);
					}
			
				}
		
			}
	
			// Outline for cave
			//generateCaveOutline(startX, endX, y_offset + 152, Depth);
	
			// Fall away Sand
			//generateFallAwaySand(endX, y_offset);
	
			// Moveable Blocks
			generateMoveableBlocks(endX, 10);
		

		}
		///////////////////////////////////////////////////////////////
	
		////////// LAVA ///////////////////////////////////////////////////////////////////
		else if (global.level == 3) {
			// Used to limit noise 
			var count = 0;
	
	
			// beginHeight is used to determine where the first block will start
			var beginHeight = round(random(amplitude)) * blockSize;
	
			// X for loop, goes from 0 to ...
			for (X = startX; X < endX; X += blockSize) {
		
				// 70% of the time the ground will be flat if 7
				if(count < flatScale) {
					count = random(10);
					flatCount += 1;
				}
				else {
					beginHeight = round(random(amplitude)) * blockSize;
					count = random(10);
					flatCount = 0;
				}
		
				// total height of the blocks in a vertical row
				var totalHeight = Depth + beginHeight;
		
				global.start_Y = beginHeight + y_offset;
		
				// Y for loop, does the vertical placement of blocks
				for (Y = beginHeight + y_offset; Y <= totalHeight + beginHeight + y_offset; Y+= blockSize) {
					// On surface
					if(Y == beginHeight+y_offset) {
						generateWater(X, Y);
						generateStairsUp(X, Y);
						generateStairsDown(X, Y);
						generateCoins(X, Y);
						generateLives(X, Y);
						generateJumps(X, Y);
					
						if (flatCount >= 3) {
							generateTraps(X, Y);
							flatCount = 0;
						}
					}
					else if Y <= totalHeight + y_offset -950  { // depth of soil to rock ration ( -10 is thicker than -40)
						if instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_wall) == noone {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
					
							// Grass
							if (instance_position(X, Y-16, obj_wall) == noone) {
								var wall = instance_create_layer(X, Y, 0, obj_wall);
								wall.sprite_index = spr_wall;
								var block = instance_create_layer(X, Y, 1, obj_block);
								block.sprite_index = spr_lavaRock_surface;
							}
						
							else {
								block.sprite_index = spr_lavaRock;
							}
						}
					}
					else {
						if (instance_position(X, Y, obj_water) == noone && instance_position(X, Y, obj_water_outline) == noone) {
							var wall = instance_create_layer(X, Y, 0, obj_wall);
							wall.sprite_index = spr_wall;
							var block = instance_create_layer(X, Y, 1, obj_block);
							block.sprite_index = spr_stone;
							if(random(10000)<25 && Y == 500) {
								//generateCaves(X, Y);	
							}
						}
					}
			
					if (instance_position(X, Y, obj_water) != noone && instance_position(X, Y, obj_block) != noone) {
						instanceClear(X, X+1, Y, Y+1);
					}
			
				}
		
			}
	
			// Outline for cave
			//generateCaveOutline(startX, endX, y_offset + 152, Depth);
	
			// Fall away Sand
			//generateFallAwaySand(endX, y_offset);
	
			// Moveable Blocks
			generateMoveableBlocks(endX, 10);
		
		
		}
		///////////////////////////////////////////////////////////////
	}
}


// Water
function canPlaceWater(X, Y) {
    // Check if there is enough space to place water without overlap
    for (var i = -32; i < 96; i += 16) {
        for (var j = -32; j < 96; j += 16) {
            if (instance_position(X + i, Y + j, obj_water) != noone) {
                return false;
            }
        }
    }
    return true;
}

function generateWater(X, Y) {
	
	if (canPlaceWater(X, Y) == true) {
		var waterProbability = round(random(15));
		if(waterProbability == 1 && instance_position(X-32, Y+16, obj_water) == noone && instance_position(X+64, Y+256, obj_water) == noone) {
			instanceClear(X, X + 64, Y, Y + 64);
			var water = instance_create_layer(X, Y, 0, obj_water);
			water.sprite_index = spr_water;
			if (global.level == 1) {
				water.sprite_index = spr_water;
			}
			else if (global.level == 2) {
				water.sprite_index = spr_mud;
			}
			else if (global.level == 3) {
				water.sprite_index = spr_lava;
			}
		
			// Surround sides of water with stone
			for (n = Y; n<Y+64; n+=16) {
				var wall = instance_create_layer(X-16, n, 0, obj_wall);
				wall.sprite_index = spr_wall;
				var block = instance_create_layer(X-16, n, 0, obj_water);
				block.sprite_index = spr_stone;
				var wall = instance_create_layer(X+64, n, 0, obj_wall);
				wall.sprite_index = spr_wall;
				var block = instance_create_layer(X+64, n, 0, obj_water);
				block.sprite_index = spr_stone;
			}
		
			// Surround bottom of water with stone
			for (n = X-32; n<X+64; n+=16) {
				var wall = instance_create_layer(n+16, Y+64, 0, obj_wall);
				wall.sprite_index = spr_wall;
				var block = instance_create_layer(n+16, Y+64, 0, obj_water_outline);
				block.sprite_index = spr_stone;
			}
	
		}
	}
	
}
function generateWaterTut(X, Y) {
	
	if (canPlaceWater(X, Y) == true) {
		var waterProbability = 1;
		if(waterProbability == 1 && instance_position(X-32, Y+16, obj_water) == noone && instance_position(X+64, Y+256, obj_water) == noone) {
			instanceClear(X, X + 64, Y, Y + 64);
			var water = instance_create_layer(X, Y, 0, obj_water);
			water.sprite_index = spr_water;
			if (global.level == 1) {
				water.sprite_index = spr_water;
			}
			else if (global.level == 2) {
				water.sprite_index = spr_mud;
			}
			else if (global.level == 3) {
				water.sprite_index = spr_lava;
			}
		
			// Surround sides of water with stone
			for (n = Y; n<Y+64; n+=16) {
				var wall = instance_create_layer(X-16, n, 0, obj_wall);
				wall.sprite_index = spr_wall;
				var block = instance_create_layer(X-16, n, 0, obj_water);
				block.sprite_index = spr_stone;
				var wall = instance_create_layer(X+64, n, 0, obj_wall);
				wall.sprite_index = spr_wall;
				var block = instance_create_layer(X+64, n, 0, obj_water);
				block.sprite_index = spr_stone;
			}
		
			// Surround bottom of water with stone
			for (n = X-32; n<X+64; n+=16) {
				var wall = instance_create_layer(n+16, Y+64, 0, obj_wall);
				wall.sprite_index = spr_wall;
				var block = instance_create_layer(n+16, Y+64, 0, obj_water_outline);
				block.sprite_index = spr_stone;
			}
	
		}
	}
	
}


// Upward Stairs
function generateStairsUp(X, Y) {
	var canPlace3 = canPlaceStairsUp3(X, Y);
	var canPlace2 = canPlaceStairsUp2(X, Y);
	
	if (canPlace3[0]) {
		generateStairsUpCustom(X, Y, canPlace3[1]);
    }
	
	if (canPlace2[0]) {
		generateStairsUpCustom(X, Y, canPlace2[1]);
    }
		
}

function canPlaceStairsUp3(X, Y) {
	
	
	// number of stairs in a row
	var s = 3;
	
    // Check if there is enough space to place stairs without overlap
    for (var i = 0; i < s; i++) {
        var stairX = X - i * 16;
        var stairY = Y + i * 16;
        if (instance_position(stairX, stairY, obj_block) != noone || instance_position(stairX, stairY, obj_water) != noone ||instance_position(stairX- (4) * 16, stairY + (4) * 16, obj_block) == noone) {
            return [false, 4];
        }
    }
    return [true, 4];
}
	
function canPlaceStairsUp2(X, Y) {

	// number of stairs in a row
	var st = 2;
	
    // Check if there is enough space to place stairs without overlap
    for (var i = 0; i < st; i++) {
        var stairX = X - i * 16;
        var stairY = Y + i * 16;
        if (instance_position(stairX, stairY, obj_block) != noone || instance_position(stairX, stairY, obj_water) != noone ||instance_position(stairX- (3) * 16, stairY + (3) * 16, obj_block) == noone) {
            return [false, 3];
        }
    }
    return [true, 3];
}

function generateStairsUpCustom(X, Y, stairsInARow) {
	
	// probability of stairs
	if (random(100) < 40){
	
	    for (var i = 0; i <= stairsInARow; i++) {
	        var stairX = X - i * 16;
	        var stairY = Y + i * 16;

	        // Create dirt block underneath stairs
	        if (instance_position(stairX, stairY + 16, obj_block) == noone && instance_position(stairX, stairY + 16, obj_water) == noone) {
	            var dirtBlock = instance_create_layer(stairX, stairY + 16, 1, obj_block);
	            
				if(instance_position(stairX , stairY +5, obj_block) == noone) {
					if (global.level == 1) {
						dirtBlock.sprite_index = spr_dirt_surface;
					}
					else if (global.level == 2) {
						dirtBlock.sprite_index = spr_desertSand_surface;
					}
					else if (global.level == 3) {
						dirtBlock.sprite_index = spr_lavaRock_surface;
					}
				}
				else {
					if (global.level == 1) {
						dirtBlock.sprite_index = spr_dirt;
					}
					else if (global.level == 2) {
						dirtBlock.sprite_index = spr_desertSand;
					}
					else if (global.level == 3) {
						dirtBlock.sprite_index = spr_lavaRock;
					}
				}
					
				var dirtBlock = instance_create_layer(stairX-16, stairY + 32, 1, obj_block);
				if (global.level == 1) {
					dirtBlock.sprite_index = spr_dirt;
				}
				else if (global.level == 2) {
					dirtBlock.sprite_index = spr_desertSand;
				}
				else if (global.level == 3) {
					dirtBlock.sprite_index = spr_lavaRock;
				}
				var dirtBlock = instance_create_layer(stairX, stairY + 32, 1, obj_block);
	            dirtBlock.sprite_index = spr_stone;
				var dirtBlock = instance_create_layer(stairX-16, stairY + 48, 1, obj_block);
	            dirtBlock.sprite_index = spr_stone;
	        }
			
			if (instance_position(stairX, stairY - 16, obj_block) == noone && instance_position(stairX-1, stairY-17, obj_block) == noone) {
		        var wallStair = instance_create_layer(stairX-16, stairY+16, 0, obj_wall);
		        wallStair.sprite_index = spr_slopeWallUp;

		        var stair = instance_create_layer(stairX-16, stairY+16, 1, obj_block);
				if (global.level == 1) {
					stair.sprite_index = spr_stair_up;
				}
				else if (global.level == 2) {
					stair.sprite_index = spr_stair_up_desert;
				}
				else if (global.level == 3) {
					stair.sprite_index = spr_stair_up_lava;
				}
				
			}
	    }
	}
}


// Downward Stairs
function generateStairsDown(X, Y) {
    var canPlace2 = canPlaceStairsDown2(X, Y);

    if (canPlace2[0]) {
        generateStairsDownCustom(X, Y, canPlace2[1]);
    }
}

function canPlaceStairsDown2(X, Y) {
    // Number of stairs in a row
    var st = 2;

    // Check if there is enough space to place stairs without overlap
    for (var i = 0; i < st; i++) {
        var stairX = X - i * 16;
        var stairY = Y - i * 16;
        if (instance_position(stairX, stairY, obj_block) != noone || instance_position(stairX, stairY, obj_water) != noone || instance_position(stairX - (3) * 16, stairY - (3) * 16, obj_block) == noone) {
            return [false, 2];
        }
    }
    return [true, 2];
}

function generateStairsDownCustom(X, Y, stairsInARow) {
    // Probability of stairs
    if (random(100) < 100) {
        for (var i = 0; i < stairsInARow; i++) {
            var stairX = X - i * 16;
            var stairY = Y - i * 16;

            // Create dirt block underneath stairs
            if (instance_position(stairX, stairY + 16, obj_block) == noone && instance_position(stairX, stairY + 16, obj_water) == noone) {
				instanceClear(stairX-15, stairX+14, stairY-16, stairY-8)
                var dirtBlock = instance_create_layer(stairX-32, stairY-16, 1, obj_block);
                if(instance_position(stairX , stairY +5, obj_block) == noone) {
					if (global.level == 1) {
						dirtBlock.sprite_index = spr_dirt_surface;
					}
					else if (global.level == 2) {
						dirtBlock.sprite_index = spr_desertSand_surface;
					}
					else if (global.level == 3) {
						dirtBlock.sprite_index = spr_lavaRock_surface;
					}
				}
				var dirtBlock = instance_create_layer(stairX-16, stairY, 1, obj_block);
                if(instance_position(stairX , stairY +5, obj_block) == noone) {
					if (global.level == 1) {
						dirtBlock.sprite_index = spr_dirt_surface;
					}
					else if (global.level == 2) {
						dirtBlock.sprite_index = spr_desertSand_surface;
					}
					else if (global.level == 3) {
						dirtBlock.sprite_index = spr_lavaRock_surface;
					}
				}
              
            }
			
			if (true) {

	            var wallStair = instance_create_layer(stairX - 16, stairY - 16, 0, obj_wall);
	            wallStair.sprite_index = spr_slopeWallDown;

	            var stair = instance_create_layer(stairX - 16, stairY - 16, 1, obj_block);
	            stair.sprite_index = spr_stair_down;
				if (global.level == 1) {
					stair.sprite_index = spr_stair_down;
				}
				else if (global.level == 2) {
					stair.sprite_index = spr_stair_down_desert;
				}
				else if (global.level == 3) {
					stair.sprite_index = spr_stair_down_lava;
				}
			}
        }
    }
}


// Caves
function generateCaves(X, Y, y_offset, Depth) {
    // Parameters to control cave generation
    var caveWidth = random_range(5, 12) * 16;  // Cave width between 3 and 8 blocks
    var caveHeight = random_range(3, 7) * 16; // Cave height between 1 and 4 blocks
    var caveLength = random_range(20, 30) * 16; // Cave length between 20 and 30 blocks, multiplied by 16 for accurate positioning
	
	caveWidth = 16 * 5;
	caveHeight = 16 * 4;
	caveLength = 16 * 20;
	
    // Define the surface level
    var surfaceY = 0;

    // Generate the cave
    var caveXStart = X;
    var caveXEnd = X + caveLength;
    var caveYStart = Y - caveHeight;
    var caveYEnd = Y;

    // Create the cave
    for (var i = caveXStart; i <= caveXEnd; i += 16) {
        var caveX = i;
        var caveY = Y + round(random_range(-1, 1)) * 16; // Slight vertical variation

        // Clear the cave space
        for (var j = caveX - caveWidth; j <= caveX; j += 16) {
            for (var k = caveY - caveHeight; k <= caveY; k += 16) {
                if ((instance_position(j, k, obj_wall) != noone || instance_position(j, k, obj_block) != noone) && instance_position(j, k, obj_water) == noone && instance_position(j, k, obj_water_outline) == noone) {
                    position_destroy(j, k);
                }
            }
        }
    }

    // Create a diagonal cutout section from a random X position to the surface
	var cutoutX = random_range(caveXStart, caveXEnd);
	var cutoutYStart = Y; // Starting point of the cutout (bottom of the cave)
	var cutoutYEnd = surfaceY; // Ending point of the cutout (surface level)

	// Ensure cutoutX is within the cave bounds
	//if (cutoutX < caveXStart) cutoutX = caveXStart;
	//if (cutoutX > caveXEnd) cutoutX = caveXEnd;

	cutoutX = caveXStart -100;

	// Define tunnel width and height
	var tunnelWidth = 3 * 16; // Width of the tunnel (3 blocks wide)
	var tunnelHeight = 3 * 16; // Height of the tunnel (3 blocks tall)

	// Clear the diagonal section
	var currentX = cutoutX;
	var currentY = cutoutYStart;

	while (currentY >= cutoutYEnd) {
	    // Clear an area around the diagonal path
	    for (var offsetX = -tunnelWidth / 2; offsetX <= tunnelWidth / 2; offsetX += 16) {
	        for (var offsetY = -tunnelHeight / 2; offsetY <= tunnelHeight / 2; offsetY += 16) {
	            var posX = currentX + offsetX;
	            var posY = currentY + offsetY;
	            if (instance_position(posX, posY, obj_water) == noone && instance_position(posX, posY, obj_water_outline) == noone && instance_position(posX, posY, obj_vine_block) == noone) {
	                //if (instance_position(posX+4, posY+5, obj_block) != noone || instance_position(posX+4, posY+5, obj_water) != noone|| instance_position(posX+3, posY+5, obj_water_outline) != noone) {
	                //    position_destroy(posX+3, posY+5);
					//	position_destroy(posX+4, posY+5);
	                //} 
					//else {
	                    position_destroy(posX, posY);
						position_destroy(posX+1, posY+2);
						//position_destroy(posX+5, posY-1);
	                //}
	            }
					
	        }
	    }

	    currentY -= 32;
	    currentX += 4;//random_range(-20, 20); // Adjust X position for a diagonal path
	}
	
	generateCaveOutline(X-144, X, y_offset-32, caveYStart+80);
	
	generateVines(caveXStart, 150);



}

//Tut Cave
function generateCavesTut(X, Y) {
    // Parameters to control cave generation
    var caveWidth = 1 * 16;  // Cave width between 3 and 8 blocks
    var caveHeight = 1 * 16; // Cave height between 1 and 4 blocks
    var caveLength = 10 * 16; // Cave length between 20 and 30 blocks, multiplied by 16 for accurate positioning
	
	caveWidth = 16 * 5;
	caveHeight = 16 * 2;
	caveLength = 16 * 1;
	
    // Define the surface level
    var surfaceY = 0;

    // Generate the cave
    var caveXStart = X;
    var caveXEnd = X + caveLength;
    var caveYStart = Y - caveHeight;
    var caveYEnd = Y;

    // Create the cave
    for (var i = caveXStart; i <= caveXEnd; i += 16) {
        var caveX = i;
        var caveY = Y ;//+ round(random_range(0)) * 16; // Slight vertical variation

        // Clear the cave space
        for (var j = caveX - caveWidth; j <= caveX; j += 16) {
            for (var k = caveY - caveHeight; k <= caveY; k += 16) {
                //if ((instance_position(j, k, obj_wall) != noone || instance_position(j, k, obj_block) != noone) && instance_position(j, k, obj_water) == noone && instance_position(j, k, obj_water_outline) == noone) {
                    position_destroy(j, k);
                //}
            }
        }
    }

    // Create a diagonal cutout section from a random X position to the surface
	var cutoutX = (caveXStart+ caveXEnd);
	var cutoutYStart = Y; // Starting point of the cutout (bottom of the cave)
	var cutoutYEnd = surfaceY; // Ending point of the cutout (surface level)

	// Ensure cutoutX is within the cave bounds
	//if (cutoutX < caveXStart) cutoutX = caveXStart;
	//if (cutoutX > caveXEnd) cutoutX = caveXEnd;

	cutoutX = caveXStart;

	// Define tunnel width and height
	var tunnelWidth = 2 * 16; // Width of the tunnel (3 blocks wide)
	var tunnelHeight = 3 * 16; // Height of the tunnel (3 blocks tall)

	// Clear the diagonal section
	var currentX = cutoutX;
	var currentY = cutoutYStart;

	while (currentY >= cutoutYEnd) {
	    // Clear an area around the diagonal path
	    for (var offsetX = -tunnelWidth ; offsetX <= tunnelWidth ; offsetX += 16) {
	        for (var offsetY = -tunnelHeight / 2; offsetY <= tunnelHeight / 2; offsetY += 16) {
	            var posX = currentX + offsetX;
	            var posY = currentY + offsetY;
	            if (instance_position(posX, posY, obj_water) == noone && instance_position(posX, posY, obj_water_outline) == noone && instance_position(posX, posY, obj_vine_block) == noone) {
	                //if (instance_position(posX+4, posY+5, obj_block) != noone || instance_position(posX+4, posY+5, obj_water) != noone|| instance_position(posX+3, posY+5, obj_water_outline) != noone) {
	                //    position_destroy(posX+3, posY+5);
					//	position_destroy(posX+4, posY+5);
	                //} 
					//else {
	                    position_destroy(posX, posY);
						position_destroy(posX+1, posY+2);
						//position_destroy(posX+5, posY-1);
	                //}
	            }
					
	        }
	    }

	    currentY -= 32;
	    currentX += 4;//random_range(-20, 20); // Adjust X position for a diagonal path
	}
	
	generateVines(caveXStart-250, 250);
	instance_create_layer(caveXStart-250 -48, 72, 0, obj_coin);
	instance_create_layer(caveXStart, 350, 0, obj_diamond);



}
function generateCaveOutline(startX, endX, y_offset, Depth) {
	//generateTopBlocks(startX, endX, y_offset, Depth);
	//generateBottomBlocks(startX, endX, y_offset, Depth);
	generateRightBlocks(startX, endX, y_offset, Depth);
	//generateLeftBlocks(startX, endX, y_offset, Depth);
	//generateCornerBlocks(startX, endX, y_offset, Depth);
}

function generateRightBlocks(startX, endX, startY, endY) {
 
    var blockWidth = 16; // Assuming each block is 16x16 pixels

    for (var i = startX; i < endX; i += blockWidth) {
        for (var j = startY-8; j <= endY; j += blockWidth) {
            // Check if there is a block at the current position
            if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
                // Check if there is no block to the right
                if (instance_position(i + blockWidth, j, obj_wall) == noone) {
                    // Create a new block to the right
                      var newBlock = instance_create_layer(i + 16, j, 0, obj_cave_outline);
                      newBlock.sprite_index = spr_stone_outline;
					  var newBlock = instance_create_layer(i + 16, j, 0, obj_wall);
                      newBlock.sprite_index = spr_wall;
					  //position_destroy(i, j);
					
                 }
				 // Check if there is no block to the left
                if (instance_position(i - blockWidth, j, obj_wall) == noone) {
                    // Create a new block to the left
                    var newBlock = instance_create_layer(i - 16, j, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i - 16, j, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				// Check if there is no block to the bottom
                if (instance_position(i, j + blockWidth, obj_wall) == noone) {
                    // Create a new block to the left
                    var newBlock = instance_create_layer(i, j + 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i, j + 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				// Check if there is no block to the top
                if (instance_position(i, j - blockWidth, obj_wall) == noone) {
                    // Create a new block to the left
                    var newBlock = instance_create_layer(i, j - 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i, j - 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				// Check if there is no block to the top left
                if (instance_position(i - blockWidth, j - blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i - 16, j - 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i - 16, j - 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				// Check if there is no block to the top right
                if (instance_position(i + blockWidth, j - blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i + 16, j - 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i + 16, j - 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				// Check if there is no block to the bottom right
                if (instance_position(i + blockWidth, j + blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i + 16, j + 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i + 16, j + 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				
				// Check if there is no block to the bottom left
                if (instance_position(i - blockWidth, j + blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i - 16, j + 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i - 16, j + 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
            }
			//if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
            //    // Check if there is no block to the left
            //    if (instance_position(i - blockWidth, j, obj_wall) == noone) {
            //        // Create a new block to the left
            //        var newBlock = instance_create_layer(i - 16, j, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i - 16, j, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
            //}
			//if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
            //    // Check if there is no block to the bottom
            //    if (instance_position(i, j + blockWidth, obj_wall) == noone) {
            //        // Create a new block to the left
            //        var newBlock = instance_create_layer(i, j + 16, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i, j + 16, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
            //}
			//if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
            //    // Check if there is no block to the top
            //    if (instance_position(i, j - blockWidth, obj_wall) == noone) {
            //        // Create a new block to the left
            //        var newBlock = instance_create_layer(i, j - 16, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i, j - 16, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
            //}
			
			/////
			//if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
            //    // Check if there is no block to the top left
            //    if (instance_position(i - blockWidth, j - blockWidth, obj_wall) == noone) {
            //        // Create a new block to the top left
            //        var newBlock = instance_create_layer(i - 16, j - 16, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i - 16, j - 16, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
				
			//	// Check if there is no block to the top right
            //    else if (instance_position(i + blockWidth, j - blockWidth, obj_wall) == noone) {
            //        // Create a new block to the top left
            //        var newBlock = instance_create_layer(i + 16, j - 16, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i + 16, j - 16, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
				
			//	// Check if there is no block to the bottom right
            //    else if (instance_position(i + blockWidth, j + blockWidth, obj_wall) == noone) {
            //        // Create a new block to the top left
            //        var newBlock = instance_create_layer(i + 16, j + 16, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i + 16, j + 16, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
				
			//	// Check if there is no block to the bottom left
            //    else if (instance_position(i - blockWidth, j + blockWidth, obj_wall) == noone) {
            //        // Create a new block to the top left
            //        var newBlock = instance_create_layer(i - 16, j + 16, 0, obj_cave_outline);
            //        newBlock.sprite_index = spr_stone_outline;
			//		var newBlock = instance_create_layer(i - 16, j + 16, 0, obj_wall);
            //        newBlock.sprite_index = spr_wall;
			//		//position_destroy(i, j);
					
            //    }
            //}
        }
    }
}

function generateLeftBlocks(startX, endX, startY, endY) {
   
    var blockWidth = 16; // Assuming each block is 16x16 pixels

    for (var i = startX; i < endX; i += blockWidth) {
        for (var j = startY-8; j <= endY; j += blockWidth) {
            // Check if there is a block at the current position
            if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
                // Check if there is no block to the left
                if (instance_position(i - blockWidth, j, obj_wall) == noone) {
                    // Create a new block to the left
                    var newBlock = instance_create_layer(i - 16, j, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i - 16, j, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
            }
        }
    }
}

function generateTopBlocks(startX, endX, startY, endY) {
   
    var blockWidth = 16; // Assuming each block is 16x16 pixels

    for (var i = startX; i < endX; i += blockWidth) {
        for (var j = startY-8; j <= endY; j += blockWidth) {
            // Check if there is a block at the current position
            if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
                // Check if there is no block to the bottom
                if (instance_position(i, j + blockWidth, obj_wall) == noone) {
                    // Create a new block to the left
                    var newBlock = instance_create_layer(i, j + 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i, j + 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
            }
        }
    }
}

function generateBottomBlocks(startX, endX, startY, endY) {
   
    var blockWidth = 16; // Assuming each block is 16x16 pixels

    for (var i = startX; i < endX; i += blockWidth) {
        for (var j = startY-8; j <= endY; j += blockWidth) {
            // Check if there is a block at the current position
            if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
                // Check if there is no block to the top
                if (instance_position(i, j - blockWidth, obj_wall) == noone) {
                    // Create a new block to the left
                    var newBlock = instance_create_layer(i, j - 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i, j - 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
            }
        }
    }
}

function generateCornerBlocks(startX, endX, startY, endY) {
   
    var blockWidth = 16; // Assuming each block is 16x16 pixels

    for (var i = startX; i < endX; i += blockWidth) {
        for (var j = startY-8; j <= endY; j += blockWidth) {
            // Check if there is a block at the current position
            if (instance_position(i, j, obj_wall) != noone && instance_position(i, j, obj_block) != noone) {
                // Check if there is no block to the top left
                if (instance_position(i - blockWidth, j - blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i - 16, j - 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i - 16, j - 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				
				// Check if there is no block to the top right
                else if (instance_position(i + blockWidth, j - blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i + 16, j - 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i + 16, j - 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				
				// Check if there is no block to the bottom right
                else if (instance_position(i + blockWidth, j + blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i + 16, j + 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i + 16, j + 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
				
				// Check if there is no block to the bottom left
                else if (instance_position(i - blockWidth, j + blockWidth, obj_wall) == noone) {
                    // Create a new block to the top left
                    var newBlock = instance_create_layer(i - 16, j + 16, 0, obj_cave_outline);
                    newBlock.sprite_index = spr_stone_outline;
					var newBlock = instance_create_layer(i - 16, j + 16, 0, obj_wall);
                    newBlock.sprite_index = spr_wall;
					//position_destroy(i, j);
					
                }
            }
        }
    }
}


// Vines
function generateVines(X, Y) {
	var numBlocks = 3;
	for (i = 0; i < numBlocks; i ++) {
		var vineWall = instance_create_layer(X + i*16 - 80, 4*16+4-16, 0, obj_wall);
		vineWall.sprite_index = spr_wall;
		var vineBlock = instance_create_layer(X + i*16 - 80, 4*16+4-16, 0, obj_vine_block);
		vineBlock.sprite_index = spr_stone_vine;
		
		//var vine = instance_create_layer(X - (numBlocks/2)*16 - (numBlocks+1)*16, 4*16+84, 0, obj_vine);
		//vine.sprite_index = spr_vine;
	}
	var vine = instance_create_layer(X - (numBlocks/2)*16 - (numBlocks+1)*16, 4*16+20-16, 0, obj_vine);
	vine.sprite_index = spr_vine;
	if (random(100) < 20 && instance_position(X - (numBlocks/2)*16 - (numBlocks+1)*16, 4*16+150, obj_wall)== noone) {
		var diamond = instance_create_layer(X - (numBlocks/2)*16 - (numBlocks+1)*16, 4*16+100+random(150), 0, obj_diamond);
	}
	
}

// Fall Away Sand
function generateFallAwaySand(X0, X1, Y) {
	
	for (i = X0; i<X1; i += 16;) {
			var newSandBlock = instance_create_layer(i, Y, 0, obj_fallAwaySand);
            newSandBlock.sprite_index = spr_fallAwaySand;

	}

}

// Moveable Blocks
function generateMoveableBlocks(X, Y) {
	
	for (i = 0; i < X; i+= 16) {
		if (random(100) < 10) {
			// Number of moveable block in a coloumn
			var z = random(5);
			for (k = 0; k < z; k++) {
				var newMoveableBlock = instance_create_layer(i, Y + k*17, 0, obj_Moveable_Block);
				newMoveableBlock.sprite_index = spr_plank;
			}
		}
	}
	
	
	
}


// Traps
function canPlaceTraps(X, Y) {
    // Check if there is enough space to place trap without overlap
	if (!instance_position(X+17, Y+16, obj_water) ) {
		return true;
	}
    else {
		return false;
	}
}

function generateTraps(X, Y) {
	if (canPlaceTraps(X, Y)) {
		if (random(10) < 5) {
			var spikes = instance_create_layer(X-16, Y+16, 0, obj_spikes);
			if (global.level == 1) {
				spikes.sprite_index = spr_spikes_jungle;
			} 
			else if (global.level == 2) {
				spikes.sprite_index = spr_spikes_desert;
			} 
			else if (global.level == 3) {
				spikes.sprite_index = spr_spikes_lava;
			}
		}
		else {
			if (global.level == 1) {
				var spikes = instance_create_layer(X-16, Y+16, 0, obj_spikes);
				spikes.sprite_index = spr_log_jungle;
				var stone = instance_create_layer(X-32, Y, 0, obj_block);
				stone.sprite_index = spr_stone;
				var stoneWall = instance_create_layer(X-32, Y, 0, obj_wall);
				stoneWall.sprite_index = spr_stone;
				var stone = instance_create_layer(X+16, Y, 0, obj_block);
				stone.sprite_index = spr_stone;
				var stoneWall = instance_create_layer(X+16, Y, 0, obj_wall);
				stoneWall.sprite_index = spr_stone;
			}
			else if (global.level == 2) {
				var spikes = instance_create_layer(X-16, Y+16, 0, obj_spikes);
				spikes.sprite_index = spr_log_desert;
				var stone = instance_create_layer(X-32, Y, 0, obj_block);
				stone.sprite_index = spr_stone;
				var stoneWall = instance_create_layer(X-32, Y, 0, obj_wall);
				stoneWall.sprite_index = spr_stone;
				var stone = instance_create_layer(X+16, Y, 0, obj_block);
				stone.sprite_index = spr_stone;
				var stoneWall = instance_create_layer(X+16, Y, 0, obj_wall);
				stoneWall.sprite_index = spr_stone;
			}
			else if (global.level == 3) {
				var spikes = instance_create_layer(X-16, Y+16, 0, obj_spikes);
				spikes.sprite_index = spr_log_lava;
				var stone = instance_create_layer(X-32, Y, 0, obj_block);
				stone.sprite_index = spr_stone;
				var stoneWall = instance_create_layer(X-32, Y, 0, obj_wall);
				stoneWall.sprite_index = spr_stone;
				var stone = instance_create_layer(X+16, Y, 0, obj_block);
				stone.sprite_index = spr_stone;
				var stoneWall = instance_create_layer(X+16, Y, 0, obj_wall);
				stoneWall.sprite_index = spr_stone;
			}
		}
	}
}

// Level End
function generateLevelEnd(X0, X1, Y) {
	
	//generateFallAwaySand(2000, 2100, 220);
	
	for (i = X0; i < X1; i+=16) {
		
		// Fall Away Sand for 200 pixels
		if (i < X0 + 200) {
			var newSandBlock = instance_create_layer(i, Y, 0, obj_fallAwaySand);
            newSandBlock.sprite_index = spr_fallAwaySand;
		}
		else {
			var Y1 = random(100);
			for (j = Y; j < Y + Y1; j+=16) {
				var wall = instance_create_layer(i, j, 0, obj_wall);
				wall.sprite_index = spr_stoneEnd;
				var block = instance_create_layer(i, j, 1, obj_endBlock);
				block.sprite_index = spr_stoneEnd;
			}
		}
	}
	
	if (global.level == 1) {
		if (!instance_exists(obj_baboon)){
			if (global.subLevel == 0) {
				var baboon = instance_create_layer(X0+(X1-X0)/2, Y-150, 1, obj_baboon);
			}
			else {
				var baboon = instance_create_layer(X0+(X1-X0)/2 -100, Y-150, 1, obj_baboon);
				var baboon1 = instance_create_layer(X0+(X1-X0)/2+100, Y-150, 1, obj_baboon);
			}
		}
	}
	else if (global.level ==2) {
		if (!instance_exists(obj_scorpion)){
			if (global.subLevel == 0) {
				var scorpion = instance_create_layer(X0+(X1-X0)/2, Y-150, 1, obj_scorpion);
			}
			else {
				var scorpion = instance_create_layer(X0+(X1-X0)/2 -100, Y-150, 1, obj_scorpion);
				var scorpion1 = instance_create_layer(X0+(X1-X0)/2 + 100, Y-150, 1, obj_scorpion);
			}
		}
	}
	else if (global.level ==3){
		if (!instance_exists(obj_komodo)){
			if (global.subLevel == 0) {
				var scorpion = instance_create_layer(X0+(X1-X0)/2, Y-150, 1, obj_komodo);
			}
			else {
				var scorpion = instance_create_layer(X0+(X1-X0)/2 -100, Y-150, 1, obj_komodo);
				var scorpion1 = instance_create_layer(X0+(X1-X0)/2 + 100, Y-150, 1, obj_komodo);
			}
		}
	}
	
	
	//if (!instance_exists(obj_diamond)){
	position_destroy(X0+(X1-X0)/2, Y-50);
	var diamond = instance_create_layer(X1-120, Y-50, 1, obj_diamond);
	//}
	
	// CheckPoints
	for (i = global.start_X+100; i <= global.start_X+164; i+= 16) {
		var wall = instance_create_layer(i, global.start_Y-16, 0, obj_wall);
		wall.sprite_index = spr_wall;
		var startPlat = instance_create_layer(i, global.start_Y-16, 1, obj_startPlatform);
		startPlat.sprite_index = spr_startPlatform;
	}
	
	//if (!instance_exists(obj_checkPoint_Up)){
		var checkPointUp = instance_create_layer(global.start_X+132, global.start_Y-16, 1, obj_checkPoint_Up);
	//}
	//if (!instance_exists(obj_checkPoint_Down)){
		var checkPointDown = instance_create_layer(X1-90, Y, 1, obj_checkPoint_Down);
	//}
	
}


// Player
function generatePlayer(X, Y) {
	
	var player = instance_create_layer(X, Y, 0, obj_player);	
	player.sprite_index = spr_new_player_right;
	
}


function generateCoins(X, Y) {
	
	coinBlockNumber += 1;
	
	if (coinBlockNumber == 5) {
		instance_create_layer(X+50, Y - coinBlockNumber*10-30, 1, obj_coin);
		coinBlockNumber = 0;
	}
	if coinBlockNumber > 5 {
		coinBlockNumber = 0;
	}
}

function generateLives(X, Y) {
	
	lifeBlockNumber += 1;
	
	if (lifeBlockNumber == 150) {
		instance_create_layer(X+16, Y - 2*10-30, 1, obj_life);
		lifeBlockNumber = 0;
	}
	if lifeBlockNumber > 150 {
		lifeBlockNumber = 0;
	}
}

function generateJumps(X, Y) {
	
	jumpBlockNumber += 1;
	
	if (jumpBlockNumber == 82) {
		instance_create_layer(X-16, Y - 2*10-30, 1, obj_jump);
		jumpBlockNumber = 0;
	}
	if jumpBlockNumber > 82 {
		jumpBlockNumber = 0;
	}
}

function generateClouds(X1, X2) {
	
	X = 0;
	
	for (i = X1; i < X2; i+= X) {
		X = random_range(50, 258);
		Y = random_range(-50, 0);
		
		var cloud = instance_create_layer(i, Y, 0, obj_level_cloud);
		c = random (10);
		if c < 5 {
			cloud.sprite_index = spr_title_cloud_1;
		}
		else {
			cloud.sprite_index = spr_title_cloud_2;
		}
		
	}
}
	


generateTerrain(global.start_X, global.end_X, 100, 5, 8, 16, 1000, 5);

generateLevelEnd(global.end_X, global.end_X + 800, 228);

generatePlayer(100, -50);


//generateTerrain(0, 2000, 100, 7, 6, 16, 500);

