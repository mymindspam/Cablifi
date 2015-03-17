import luxe.States;
import luxe.Parcel;
import luxe.ParcelProgress;
import luxe.Color;
import states.Game;

class Main extends luxe.Game {

	public static var state: States;
	public static var progress: ParcelProgress;

	override function ready() {

		var assetsJSON = Luxe.loadJSON("assets/parcel.json");
		var preload = new Parcel();
		preload.from_json(assetsJSON.json);

		progress = new ParcelProgress({
			parcel: preload,
			background  : new Color(0, 0, 0, 0),
            bar         : new Color().rgb(0xf94b04),
            bar_border  : new Color().rgb(0xf94b04),
            oncomplete  : startGame,
            fade_in     : false,
            fade_out    : true
		});

		preload.load();
	} // ready 

	function startGame(parcel:Parcel) {

		state = new States({ name: 'state' });
		state.add(new Game());
		state.set("game");

	} // startGame

} // Main