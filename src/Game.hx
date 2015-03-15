import luxe.States;
import luxe.Sprite;
import luxe.Vector;

import phoenix.Texture;
import luxe.Input;

class Game extends State {

	var player: Sprite;
	var image: Texture;

	var speed: Float = 300;
	var maxLeft: Float = 0;
	var maxRight: Float = 0; 
	
	public function new() {

		super({  name: "game" });

		loadScene();
		loadPlayer();
		loadPlayerInput();

	} // new

	function loadScene(){

		Luxe.renderer.clear_color.rgb(0x7f8c8d);

		// TODO: Map

	} // loadScene

	function loadPlayer(){

		var image = Luxe.loadTexture("assets/cubePlayer.png");
		image.filter = FilterType.nearest;

		var width = 16;
		var height = 16;

		maxRight = Luxe.screen.w - (width / 2);
		maxLeft = (width / 2);

		player  = new Sprite({
			name: "player",
			texture: image,
			pos: new Vector(Luxe.screen.mid.x, Luxe.screen.h - (height / 2)),
			size: new Vector(width, height)
		});

	} // loadPlayer

	function loadPlayerInput(){

		Luxe.input.bind_key('left', Key.left);
		Luxe.input.bind_key('left', Key.key_a);

		Luxe.input.bind_key('right', Key.right);
		Luxe.input.bind_key('right', Key.key_d);

		Luxe.input.bind_key('up', Key.up);
		Luxe.input.bind_key('up', Key.key_w);

		Luxe.input.bind_key('down', Key.down);
		Luxe.input.bind_key('down', Key.key_s);

	} // loadPlayerInput

	override function update(dt:Float) {

		if(player == null){
			return;
		}

		var moving  = false;

		if(Luxe.input.inputdown('left')){
			player.pos.x -= speed * dt;
			moving = true;
		}

		if(Luxe.input.inputdown('right')){
			player.pos.x += speed * dt;
			moving = true;
		}

		if(Luxe.input.inputdown('up')){
			player.pos.y -= speed * dt;
			moving = true;
		}

		if(Luxe.input.inputdown('down')){
			player.pos.y += speed * dt;
			moving = true;
		}
	} // update

	override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} // Game