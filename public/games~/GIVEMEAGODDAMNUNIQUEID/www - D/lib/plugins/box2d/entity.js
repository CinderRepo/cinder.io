ig.module( 
	'plugins.box2d.entity'
)
.requires(
	'impact.entity',	
	'plugins.box2d.game'
)
.defines(function(){


ig.Box2DEntity = ig.Entity.extend({
	focus: true,
	moved: false,
	body: null,
	angle: 0,
	
	init: function( x, y , settings ) {
		this.parent( x, y, settings );
		
		// Only create a box2d body when we are not in Weltmeister
		if( !ig.global.wm ) { 
			this.createBody();
		}
	},
	
	createBody: function() {
		var bodyDef = new b2.BodyDef();
		bodyDef.position.Set(
			(this.pos.x + this.size.x / 2) * b2.SCALE,
			(this.pos.y + this.size.y / 2) * b2.SCALE
		);
		
		this.body = ig.world.CreateBody(bodyDef);
		
		var shapeDef = new b2.PolygonDef();
		shapeDef.SetAsBox(
			this.size.x / 2 * b2.SCALE,
			this.size.y / 2 * b2.SCALE
		);
		
		shapeDef.density = 1;
		//shapeDef.restitution = 0.0;
		//shapeDef.friction = 0.9;
		this.body.CreateShape(shapeDef);
		this.body.SetMassFromShapes();
	},
	
	update: function() {		
		var p = this.body.GetPosition();
		var xTranslation = 0;
		
		this.pos = {
			x: (p.x / b2.SCALE - this.size.x / 2 + xTranslation),
			y: (p.y / b2.SCALE - this.size.y / 2 )
		};
		this.angle = this.body.GetAngle().round(2);
		
		if( this.currentAnim ) {
			this.currentAnim.update();
			this.currentAnim.angle = this.angle;
			if(this.body.m_linearVelocity.y != 0) {
				this.moved = true;
			}
			if(this.focus) {
				if( this.moved && this.body.m_linearVelocity.x < 0.01 && this.body.m_linearVelocity.y < 0.01) {
					this.focus = false;
					this.triggerNewBlock();	
					
				}
				else if(this.body) {
					var a = this.body.GetAngle();
					if(ig.input.state('left')) {
						p.x -= 0.2;
						this.body.SetXForm(p,a);
					}
					else if(ig.input.state('right')) {
						p.x += 0.2;
						this.body.SetXForm(p,a);
					}
					if(ig.input.state('up')) {
						a += 0.05;
						this.body.SetXForm(p,a);
					}
					if(ig.input.state('down')) {
						a -= 0.05;
						this.body.SetXForm(p,a);
					}
				}
			}
		}
	},
	
	kill: function() {
		ig.world.DestroyBody( this.body );
		this.parent();
	},
	
	triggerNewBlock: function() {
		ig.game.newBlock();
	}
});
	
});