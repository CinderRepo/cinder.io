ig.module(
	'game.entities.block'
)
.requires(
	'impact.entity',
	'plugins.box2d.entity'
)
.defines(function(){

EntityBlock = ig.Box2DEntity.extend({

	size: {x: 64, y: 64},
	
	type: ig.Entity.TYPE.A,
	checkAgainst: ig.Entity.TYPE.A,
	collides: ig.Entity.COLLIDES.B,
	
	animSheet: new ig.AnimationSheet( 'media/lvl1/lv1_block.png', 64, 64 ),


	init: function( x, y, settings ) {
		this.addAnim( 'idle', 1, [0] );
		this.parent( x, y, settings );
		// console.log(this);

	},
	createBody: function() {

		// body def
		var bodyDef = new b2.BodyDef();
		bodyDef.position.Set(
		    (this.pos.x + this.size.x / 2) * b2.SCALE,
		    (this.pos.y + this.size.y / 2) * b2.SCALE );
		bodyDef.type = b2.Body.b2_kinematicBody;
		bodyDef.userData = "BLOCK";
		bodyDef.linearDamping = 0.8;
		bodyDef.fixedRotation = false;
		// bodyDef.mass = 25;

		var shapeDef = new b2.PolygonDef();
		shapeDef.SetAsBox(
			this.size.x / 2 * b2.SCALE,
			this.size.y / 2 * b2.SCALE
		);
		shapeDef.mass = 5560;
		shapeDef.density = 1;
		shapeDef.friction = 7;
		shapeDef.LinearDamping = 0.5;
		shapeDef.restitution = .0005;

		this.body = ig.world.CreateBody(bodyDef);
		this.body.CreateShape(shapeDef);
		this.body.SetMassFromShapes();
		//this.body = ig.world.CreateBody(bodyDef);
	},
	update: function() {
		
		//this.body.ballShapeDef.friction = 0.f;

		//this.body.SetXForm(this.body.GetPosition(), 0);
		
		// move!
		this.parent();
	}
});


});