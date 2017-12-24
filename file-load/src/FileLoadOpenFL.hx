import openfl.display.Sprite;

class FileLoadOpenFL extends Sprite {
    
    public function new() {
        super();

        trace('OpenFL');

        new FileLoadSample();
    }
}