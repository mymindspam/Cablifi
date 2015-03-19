package components;

import luxe.Component;
import luxe.Vector;
import luxe.Color;

import luxe.Rectangle;
import luxe.collision.shapes.Polygon;
import luxe.collision.CollisionData;

import luxe.collision.Collision;
import luxe.collision.shapes.Shape;
import luxe.collision.shapes.Circle;

import luxe.collision.ShapeDrawerLuxe;
import luxe.Entity;

/*
 * @author Dohxis
 *
*/

typedef Options = {
	> luxe.options.ComponentOptions,
	var hitbox: Rectangle;
}

class Collision extends Component {

	// Variables
	var drawer		: ShapeDrawerLuxe;
	var position	: Vector;
	var box			: Shape;

	override public function new(options:Options){

		super(options);
		position = new Vector(options.hitbox.x, options.hitbox.y);
		box = Polygon.rectangle(options.hitbox.x, options.hitbox.y, options.hitbox.w, options.hitbox.h);
		drawer = new ShapeDrawerLuxe();

	} // new

	override function update(deltaTime:Float){

		box.position = entity.pos;
		drawer.drawPolygon(cast box, new Color().rgb(0xf94b04), true);

	} // update

}