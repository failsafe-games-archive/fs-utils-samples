import fs.core.File;

using tink.CoreApi;

@await class FileLoadSample {

    public function new() {
        trace('FileLoadSample');
        
        test1();        
    }

    @async public function test1() {
        trace('1111');

        //var text = @await File.load('google.com/allo.txt');
        //trace(text.substr(0, 10));

        File.load('assets/test.ogg').handle((outcome) -> switch(outcome) {
            case Success(bytes) : trace(bytes.length);
            case Failure(error) : trace('Cannot load!!!');
        });
        
        trace('22222');
    }

    // Main entry point
    static public function main() {
        new FileLoadSample();
    }
}

