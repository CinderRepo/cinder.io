ig.module(
	'game.entities.drop'
)
.requires(
	'impact.entity'
)
.defines(function(){

EntityDrop = ig.Entity.extend({

	size: {x: 400, y: 30},
	
	type: ig.Entity.TYPE.B,
	checkAgainst: ig.Entity.TYPE.A,
	collides: ig.Entity.COLLIDES.NEVER,
	drop: true,


	init: function( x, y, settings ) {
		// this.addAnim( 'idle', 1, [0] );
		this.parent( x, y, settings );
		this.gravityFactor = 0;

	},

	update: function() {
		// move!
		this.parent();
	},

	check: function( other ) {
		other.kill();
		// console.log('test');
		ig.game.spawnEntity("EntityFuckinguy", 820, ig.game.screen.y + 80, 
			{speech: ["WHAT THE FUCK MAN!\nYOU DROPPED A PIECE"]});
		if (other.focus) {
			ig.game.newBlock();
		};
	}
});


});