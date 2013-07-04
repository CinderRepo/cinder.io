ig.module(
	'game.entities.multi'
)
.requires(
	'impact.entity',
	'plugins.box2d.entity'
)
.defines(function(){

EntityMulti = ig.Box2DEntity.extend({

	size: {x: 64, y: 64},
	
	type: ig.Entity.TYPE.A,
	checkAgainst: ig.Entity.TYPE.A,
	collides: ig.Entity.COLLIDES.B,
	
	animSheet: new ig.AnimationSheet( 'media/lvl1/lv1_triangle.png', 64, 64 ),


	init: function( x, y, settings ) {
		this.addAnim( 'idle', 1, [0] );
		this.parent( x, y, settings );

	},
	createBody: function() {

		// body def
		var bodyDef = new b2.BodyDef();
		bodyDef.position.Set(
		    (this.pos.x + this.size.x / 2) * b2.SCALE,
		    (this.pos.y + this.size.y / 2) * b2.SCALE );
		bodyDef.type = b2.Body.b2_kinematicBody;
		bodyDef.userData = "TRIANGLE";
		bodyDef.linearDamping = 0.8;

		bodyDef.fixedRotation = false;
		
		//shape def
		var shapeDef = new b2.PolygonDef();
		shapeDef.vertexCount = 6;

		shapeDef.vertices[0].Set(-2, -2);
		shapeDef.vertices[1].Set(2, -2);
		shapeDef.vertices[2].Set(2, 2);
		shapeDef.vertices[3].Set(-4, 2);
		shapeDef.vertices[4].Set(-4, 0);
		shapeDef.vertices[5].Set(-3, -1);

		shapeDef.angle = 15;
		shapeDef.density = 1;
		shapeDef.friction = 0.9 ;
		shapeDef.restitution = 0;

		this.body = ig.world.CreateBody(bodyDef);
		this.body.CreateShape(shapeDef);
		this.body.SetMassFromShapes();
		//this.body = ig.world.CreateBody(bodyDef);
	},
	
	rotateTo: function (degrees)
	{
	    this.anims.idle.angle += degrees.toRad();
	    this.body.SetXForm(this.body.GetPosition(), degrees.toRad());
	},

	update: function() {
		
		// this.body.SetXForm(this.body.GetPosition(), 0);
		
		// move!
		this.parent();
	}
});


});