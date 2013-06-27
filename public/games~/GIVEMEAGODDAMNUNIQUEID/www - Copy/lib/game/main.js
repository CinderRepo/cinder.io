ig.module( 
	'game.main' 
)
.requires(
	'impact.game',
	'impact.font',
	'impact.sound',
	
	'game.entities.drop',
	'game.entities.block',
	'game.entities.triangle',
	'game.entities.multi',
	'game.entities.multi2',
	'game.entities.bar1',
	'game.entities.base',
	'game.entities.fuckinguy',
	'game.entities.fillblock',

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
	fontUi: new ig.Font( 'media/uiFont.png' ),
	gravity: 120, // All entities are affected by this
	// debugCollisionRects: true,
	speech : [],
	height: 0,
	spawnPieces: true,
	clearColor: '#1b2026',
	currentLevel: 0,

	init: function() {
		// Initialize your game here; bind keys etc.
		this.loadLevel( LevelLevel );
		ig.input.bind( ig.KEY.UP_ARROW, 'up' );
		ig.input.bind( ig.KEY.LEFT_ARROW, 'left');
		ig.input.bind( ig.KEY.RIGHT_ARROW, 'right');
		ig.input.bind( ig.KEY.DOWN_ARROW, 'down');
		this.snd_buildit = new ig.Sound( 'media/ogg/canWeBuildIt5.ogg' );
		// sound.play();
		// ig.game.screen.y = 2500;
		ig.setNocache( true );
		this.fontUi.letterSpacing = 0;
		this.snd_buildit.play();
		
	},
	
	loadLevel: function( data ) {
		this.parent( data );
		this.debugDrawer = new ig.Box2DDebug( ig.world );

	},
	update: function() {
		if (this.start && (ig.game.screen.y < 3470) && (this.currentLevel == 0)) {
			ig.game.screen.y += 25;
		} else {
			this.start = false;
			if (this.gamestarts) {
				this.newBlock();
				ig.game.spawnEntity("EntityFuckinguy", 820, ig.game.screen.y + 80, 
					{speech: ["WELCOME TO FUCKIN'\nTOWER GAME", "NOW GET TO FUCKIN'\nWORK!", "SHIT WILL START FALLING!"]});
				this.gamestarts = false;
			}
		}

		if (this.currentLevel == 1 && (ig.game.screen.y > 2890) ) {
			ig.game.screen.y -= 25;
		}

		if (this.height > 300 && this.spawnPieces==true && this.currentLevel == 0) {
			this.spawnPieces = false;
			this.fillBuilding();
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
        ig.game.fontUi.draw('FUCKIN\' HEIGHT: ' + this.height, 580, 10 );

	},
	fillBuilding: function(fillLevel) {
		var start = 4064;
		var timer = 150;
		for (var i = start; i > (start - 660); i-=32) {
			setTimeout('ig.game.spawnEntity("EntityFillblock", 252, '+i+')', timer);
			timer += 150;
		}
		setTimeout('ig.game.moveBuildingBase()', (timer + 950));
		setTimeout('ig.game.currentLevel=1', (timer + 250));
		setTimeout('ig.game.spawnPieces=true', (timer + 1350));
		setTimeout('ig.game.newBlock()', (timer + 1350));
	},
	newBlock: function() {
		var blockTypes = ["EntityBar1", "EntityBlock",  "EntityMulti", "EntityMulti2"];
		var blockTypes = ["EntityBar1", "EntityBlock"]; 
		var newType = Math.floor(Math.random() * blockTypes.length);
		// console.log('new block');
		if (this.spawnPieces) {
			var spawnPosition = this.screen.y - 300 > 0 ? this.screen.y - 300 : 0;
			var newEntity = ig.game.spawnEntity(blockTypes[newType], 350, spawnPosition);
			var angle = newEntity.body.GetAngle() + (Math.random()*6.28);
			newEntity.body.SetXForm(newEntity.body.GetPosition(), angle);
		}
	},
	moveBuildingBase: function() {
		
		for (var i = 0; i < 800; i++) {
			// this.collisionMap.data[120][i] = 1;
			ig.game.collisionMap.setTile(i, 3450, 1);



			//this.debugDrawer = new ig.Box2DDebug( ig.world );
		};

		var bodyDef = new b2.BodyDef();
		bodyDef.position.Set(
		    (255 + 418 / 2) * b2.SCALE,
		    (ig.game.screen.y + 555 + 55 / 2) * b2.SCALE );
		bodyDef.type = b2.Body.b2_kinematicBody;
		bodyDef.userData = "BLOCK";

		var shapeDef = new b2.PolygonDef();
		shapeDef.SetAsBox(
			415 / 2 * b2.SCALE,
			70 / 2 * b2.SCALE
		);
		wbody = ig.world.CreateBody(bodyDef);
		wbody.CreateShape(shapeDef);
		wbody.SetMassFromShapes();

		entities = ig.game.entities;
		for (var i = 0; i < entities.length; i++) {
			if (entities[i].drop == true) {
				console.log('here!');
				entities[i].pos.y = ig.game.screen.y + 562; 
			}
		};


		// // a = wbody.GetAngle();
		// wbody = ig.world.GetBodyList();
		// // console.log(wbody.GetPosition());
		// p = wbody.GetPosition();
		// p.y -= 600;
		// wbody.SetXForm(p,wbody.GetAngle());
		// console.log(wbody.GetPosition());
		// ig.world = this.createWorldFromMap( this.collisionMap.data, 40, 128, 32 );
	}


});


// Start the Game with 60fps, a resolution of 320x240, scaled
// up by a factor of 2
ig.main( '#canvas', MyGame, 60, 1024, 600, 1 );

});
