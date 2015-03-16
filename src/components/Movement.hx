package components;

import luxe.Component;
import luxe.Sprite;
import luxe.Input;

class Movement extends Component {

	var sprite: Sprite;
	var velocityX: Float; 
	var velocityY: Float; 
	var speedPerPixel: Int = 50;
	var gravity: Float = 500;

	override function init(){
		
		sprite = cast entity;
		loadPlayerInput();

	} // init

	override function update(dt:Float){

		if(sprite == null){
			return;
		}

		var moving  = false;
		var jumping = false;

		if(Luxe.input.inputdown('left')){
			sprite.pos.x -= speedPerPixel * dt;
			moving = true;
		}

		if(Luxe.input.inputdown('right')){
			sprite.pos.x += speedPerPixel * dt;
			moving = true;
		}

		if(Luxe.input.inputpressed('up')){
			velocityY = -124;
			jumping = true;
		}

		if(Luxe.input.inputreleased('up')){
			if(velocityY < -64) velocityY = -64;
		}

		sprite.pos.x += velocityX * dt;
		sprite.pos.y += velocityY * dt;
		velocityY += gravity * dt;

	} // update

	function loadPlayerInput(){

		Luxe.input.bind_key('left', Key.left);
		Luxe.input.bind_key('left', Key.key_a);

		Luxe.input.bind_key('right', Key.right);
		Luxe.input.bind_key('right', Key.key_d);

		Luxe.input.bind_key('up', Key.up);
		Luxe.input.bind_key('up', Key.key_w);
		Luxe.input.bind_key('up', Key.space);

	} // loadPlayerInput

}