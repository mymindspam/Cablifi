package components;

import luxe.Component;
import luxe.Sprite;
import luxe.Input;

/* 
 * @author Dohxis
 *
*/

class Movement extends Component {

	// Variables 
	var player 		: Sprite;
	var state		: String;
	var velocity 	: Float;
	var speed 		: Float;
	var gravity		: Float;

	override function init(){

		player = cast entity;
		bindKeys();

		// set default variables
		state = "idle";
		speed = 1.1;
		gravity = 9.3;

	} // init

	override function update(deltaTime:Float){

		if(Luxe.input.inputdown('left')){
			player.pos.x -= speed * 100 * deltaTime;
			state = "moving";
		}

		if(Luxe.input.inputdown('right')){
			player.pos.x += speed * 100 * deltaTime;
			state = "moving";
		}

		if(Luxe.input.inputpressed('up')){
			velocity = (-1 * (speed * 100));
			state = "jumping";
		}

		if(Luxe.input.inputreleased('up')){
			if(velocity < (-1 * ((speed * 100) / 2))) velocity = (-1 * ((speed * 100) / 2));
		}

		// Pull player down every frame
		player.pos.y += velocity * deltaTime;
		velocity += gravity * 10 * deltaTime;

	}

	function bindKeys(){

		Luxe.input.bind_key('left', Key.left);
		Luxe.input.bind_key('left', Key.key_a);

		Luxe.input.bind_key('right', Key.right);
		Luxe.input.bind_key('right', Key.key_d);

		Luxe.input.bind_key('up', Key.up);
		Luxe.input.bind_key('up', Key.key_w);
		Luxe.input.bind_key('up', Key.space);

	} // bindKeys

	public function getState(){
		return state;
	} // getState

	public function getVelocity(){
		return velocity;
	} // getVelocity

	public function getSpeed(){
		return speed;
	} // getSpeed

}