ig.module(
	'game.entities.fillblock'

)
.requires(
	'impact.entity',
	'plugins.box2d.entity'
)
.defines(function(){

EntityFillblock = ig.Entity.extend({

	size: {x: 416, y: 32},
	type: ig.Entity.TYPE.NONE,
	checkAgainst: ig.Entity.TYPE.NONE,
	collides: ig.Entity.COLLIDES.NEVER,
	speech_index : 0,
	animSheet: new ig.AnimationSheet( 'media/lvl1/lvl1_locked.png', 416, 32 ),
	counter: 0,

	init: function( x, y, settings ) {
		this.addAnim( 'idle', .4, [0] );
		this.parent( x, y, settings );
		this.gravityFactor = 0;
	},
	update: function() {
		this.counter++;
		this.parent();
	},
	draw: function() {
	
		this.parent();
	}
});


});