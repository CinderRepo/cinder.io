ig.module(
	'game.entities.bar1'
)
.requires(
	'impact.entity',
	'plugins.box2d.entity'
)
.defines(function(){

EntityBar1 = ig.Box2DEntity.extend({

	size: {x: 192, y: 32},
	
	type: ig.Entity.TYPE.A,
	checkAgainst: ig.Entity.TYPE.A,
	collides: ig.Entity.COLLIDES.NEVER,
	
	animSheet: new ig.AnimationSheet( 'media/lvl1/lv1_rectangle.png', 192, 32 ),


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
		shapeDef.vertexCount = 4;

		shapeDef.vertices[0].Set(8.9, -1.2);
		shapeDef.vertices[1].Set(8.9, 1.2);
		shapeDef.vertices[2].Set(-8.9, 1.2);
		shapeDef.vertices[3].Set(-8.9, -1.2);


		shapeDef.angle = 15;
		shapeDef.density = 1;
		shapeDef.friction = 0.9 ;
		shapeDef.restitution = 0;

		this.body = ig.world.CreateBody(bodyDef);
		this.body.CreateShape(shapeDef);
		this.body.SetMassFromShapes();
	},
	
	rotateTo: function (degrees)
	{
	    this.anims.idle.angle += degrees.toRad();
	    this.body.SetXForm(this.body.GetPosition(), degrees.toRad());
	},

	update: function() {
		// move!
		this.parent();
	}
});


});