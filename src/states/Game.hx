package states;

import luxe.States;
import luxe.Sprite;
import luxe.Vector;

import phoenix.Texture;
import luxe.Input;
import luxe.importers.tiled.TiledMap;

class Game extends State {

	var player: Sprite;
	var image: Texture;
	var map: TiledMap;

	var speed: Float = 300;
	var tileX: Float = 16;
	var tileY: Float = 16;
	
	public function new() {

		super({  name: "game" });

		loadScene();
		loadPlayer();
		loadPlayerInput();

	} // new

	function loadScene(){

		Luxe.renderer.clear_color.rgb(0x7f8c8d);
		map = new TiledMap({ file: "assets/map1.json", format: "json", pos: new Vector(0, 0) });
		map.display({ scale: 1, grid: false, filter: FilterType.nearest });
	} // loadScene

	function loadPlayer(){

		var image = Luxe.loadTexture("assets/playerCube.png");
		image.filter = FilterType.nearest;

		var width = 16;
		var height = 16;

		player  = new Sprite({
			name: "player",
			texture: image,
			// 640 / 16 = 40
			// 480 / 16 = 30
			pos: new Vector(Luxe.screen.w - (35 * tileX), Luxe.screen.h - (5 * tileY)),
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
		Luxe.input.bind_key('up', Key.space);

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
		
	} // update

	override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} // Game