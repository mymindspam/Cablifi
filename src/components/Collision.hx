package components;

import luxe.Component;
import luxe.Vector;
import luxe.Color;

import luxe.collision.shapes.Polygon;
import luxe.collision.CollisionData;
import luxe.collision.Collision;

import luxe.collision.ShapeDrawerLuxe;
import luxe.Sprite;

/*
 * @author Dohxis
 *
*/

class Collision extends Component {

	// Variables
	var drawer		: ShapeDrawerLuxe;
	var color 		: Int;
	var box			: Polygon;
	var position	: Vector;
	var collide		: CollisionData;
	var coordX		: Float;
	var coordY		: Float;
	var sizeX		: Float;
	var sizeY		: Float;
	var object		: Sprite;

	override function init(){

		object = cast entity;
		drawer = new ShapeDrawerLuxe();
		position = new Vector();
		box = Polygon.rectangle(coordY, coordX, sizeX, sizeY);

	} // init

	public function setCollision(cX:Float, cY:Float, sX: Float, sY: Float){

		coordX = cX;
		coordY = cY;

		sizeX = sX;
		sizeY = sY;

	} // setCollision

	public function testCollision( testOn:Polygon ){

		collide = luxe.collision.Collision.test(box, testOn);

		if(collide != null){
			trace("Collsion detected!");
		}

	} // testCollision

	override function update(deltaTime:Float){

		// update coordinates
		box.x = coordX;
		box.y = coordY;

		drawer.drawPolygon(box, new Color().rgb(0xf94b04), true);

	} // update

}