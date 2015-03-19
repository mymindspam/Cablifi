package states;

import luxe.States;
import luxe.Sprite;
import luxe.Vector;

import phoenix.Texture;
import luxe.Input;
import luxe.importers.tiled.TiledMap;

import components.*;
import luxe.collision.shapes.Polygon;
import luxe.collision.ShapeDrawerLuxe;

import luxe.Color;

class Game extends State {

	var player: Sprite;
	var image: Texture;
	var map: TiledMap;
	var movement: Movement;
	var collision: Collision;
	var ground: Polygon;
	var drawer: ShapeDrawerLuxe; 

	var tileX: Float = 16;
	var tileY: Float = 16;
	
	public function new() {

		super({  name: "game" });

		loadScene();
		loadPlayer();

	} // new

	function loadScene(){

		Luxe.renderer.clear_color.rgb(0x7f8c8d);
		drawer = new ShapeDrawerLuxe();
		map = new TiledMap({ file: "assets/map1.json", format: "json", pos: new Vector(0, 0) });
		map.display({ scale: 1, grid: false, filter: FilterType.nearest });
		ground = Polygon.create(100, 100, 4, 50);

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
			pos: new Vector(Luxe.screen.w - (30 * tileX), Luxe.screen.h - (20 * tileY)),
			size: new Vector(width, height)
		});

		movement = new Movement({ name: "movement" });
		collision = new Collision({ name: "collision" });
		
		player.add(movement);
		player.add(collision);

	} // loadPlayer

	override function update(dt:Float) {

		collision.setCollision(player.pos.x, player.pos.y, tileX, tileY);
		//collision.testCollision(ground);

		//drawer.drawPolygon(ground, new Color().rgb(0xf94b04), true);
		
	} // update

	override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

} // Game