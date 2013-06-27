ig.module(
	'game.entities.base'
)
.requires(
	'impact.entity',
	'plugins.box2d.entity'
)
.defines(function(){

EntityBase = ig.Box2DEntity.extend({

	gravity: 0,
	size: {x: 500, y: 32},
	
	type: ig.Entity.TYPE.B,
	checkAgainst: ig.Entity.TYPE.A,
	collides: ig.Entity.COLLIDES.NEVER,
	
	animSheet: new ig.AnimationSheet( 'media/block.png', 64, 64 ),
	
	init: function( x, y, settings ) {
		this.addAnim( 'idle', 1, [0] );
		this.parent( x, y, settings );
	},
	
	update: function() {
		
		this.body.SetXForm(this.body.GetPosition(), 0);
		
		// move!
		this.parent();
		console.log(this.vel.x);
		
		if(this.vel.x == 0 && this.vel.y == 0) {
			this.triggerNewBlock();
		}
	},
	
	triggerNewBlock: function() {
		console.log("No velocity. New block!");
		ig.newBlock();
	}
});


});