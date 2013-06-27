ig.module( 
	'game.main' 
)
.requires(
	'impact.game',
	'impact.font',
	'impact.sound',
	
	'game.entities.block2',
	'game.entities.drop',
	'game.entities.block',
	'game.entities.sphere',
	'game.entities.triangle',
	'game.entities.multi',
	'game.entities.bar1',
	'game.entities.base',
	'game.entities.fuckinguy',

	'impact.image',
	// 'impact.font',

	'game.levels.level',
	'game.levels.level2',
	
	'plugins.box2d.game',
	'plugins.box2d.debug'
)
.defines(function(){

MyGame = ig.Box2DGame.extend({
	start : true,
	gamestarts: true,
	// Load a font
	font: new ig.Font( 'media/bubblefont.png' ),
	gravity: 20, // All entities are affected by this
	debugCollisionRects: true,
	speech : [],
	clearColor: '#1b2026',


	init: function() {
		// Initialize your game here; bind keys etc.
		this.loadLevel( LevelLevel );
		ig.input.bind( ig.KEY.UP_ARROW, 'up' );
		ig.input.bind( ig.KEY.LEFT_ARROW, 'left');
		ig.input.bind( ig.KEY.RIGHT_ARROW, 'right');
		ig.input.bind( ig.KEY.DOWN_ARROW, 'down');
		ig.game.screen.y = 2500;
		ig.setNocache( true );
		
	},
	
	loadLevel: function( data ) {
		this.parent( data );
		this.debugDrawer = new ig.Box2DDebug( ig.world );

	},
	update: function() {
		if (this.start && ig.game.screen.y < 3490) {
			ig.game.screen.y += 25;
		} else {
			this.start = false;
			if (this.gamestarts) {
				this.newBlock();
				ig.game.spawnEntity("EntityFuckinguy", 820, 3590, 
					{speech: ["WELCOME TO FUCKING\nTOWER GAME", "NOW GET TO FUCKING\nWORK!", "SHIT WILL START FALLING!"]});
				this.gamestarts = false;
			}
		}
		// Update all entities and backgroundMaps

		this.parent();
	},
	
	draw: function() {
		// Draw all entities and backgroundMaps
		this.parent();
		ig.world.Step( ig.system.tick, 1 );

		// Add your own drawing code here
		var x = ig.system.width/2,
			y = ig.system.height/2;
		if (this.debugCollisionRects) {
            // Draw outlines of all collision rects
            var ts = this.collisionMap.tilesize;
            for (var i = 0; i < this.collisionRects.length; i++) {
                var rect = this.collisionRects[i];
                ig.system.context.strokeStyle = '#00ff00';
                ig.system.context.strokeRect(
                    ig.system.getDrawPos(rect.x * ts - this.screen.x),
                    ig.system.getDrawPos(rect.y * ts - this.screen.y),
                    ig.system.getDrawPos(rect.width * ts),
                    ig.system.getDrawPos(rect.height * ts)
                );
            }
        }
        
        var img = new ig.Image( 'media/logo.png' );
        if (this.start) {
	        img.draw( 160, 70 );
        }
        this.debugDrawer.draw();

	},
	
	newBlock: function() {
		var blockTypes = ["EntityBar1", "EntityBlock", "EntityTriangle", "EntityMulti"]; 
		// var blockTypes = ["EntityBar1"]; 
		var newType = Math.floor(Math.random() * blockTypes.length);
		console.log('runs');
		var spawnPosition = this.screen.y - 300 > 0 ? this.screen.y - 300 : 0;
		ig.game.spawnEntity(blockTypes[newType], 350, this.screen.y - 300);
	}

});


// Start the Game with 60fps, a resolution of 320x240, scaled
// up by a factor of 2
ig.main( '#canvas', MyGame, 60, 1024, 600, 1 );

// Play some music
var music = new ig.Sound( 'music_happy-bits.mp3' );
music.play();

});
