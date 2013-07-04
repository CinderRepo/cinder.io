ig.module(
	'game.entities.fuckinguy'

)
.requires(
	'impact.entity',
	'plugins.box2d.entity'
)
.defines(function(){

EntityFuckinguy = ig.Entity.extend({

	size: {x: 150, y: 150},
	font: new ig.Font( 'media/bubblefont.png' ),
	type: ig.Entity.TYPE.NONE,
	checkAgainst: ig.Entity.TYPE.A,
	collides: ig.Entity.COLLIDES.NEVER,
	bubble : new ig.Image( 'media/speech_bubble.png' ),
	speech_index : 0,
	animSheet: new ig.AnimationSheet( 'media/fuckinguy.png', 150, 150 ),
	counter: 0,

	init: function( x, y, settings ) {
		this.addAnim( 'idle', .4, [0,1] );
		this.parent( x, y, settings );
		this.gravityFactor = 0;
		// console.log(this);
		this.speech = settings.speech;
		this.speech_limit = this.speech.length;
	},
	update: function() {
		this.counter++;
		if (this.counter >= 120) {
			this.speech_index++;
			// console.log(this.speech_limit);
			if (this.speech_index >= this.speech_limit) {
				this.kill();
			}
			this.counter = 0;
		}
		this.parent();
	},
	draw: function() {
	
		this.parent();
		this.bubble.draw( 420, 120 );
		ig.game.font.draw( this.speech[this.speech_index], 430, 135 );
	}
});


});