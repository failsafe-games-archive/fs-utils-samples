import fs.core.File;

import tink.RunLoop;

using tink.CoreApi;

@await class FileLoadSample {

    public function new() {
        trace('FileLoadSample');

        test1();        
    }

    @async public function test1() {
        trace('1111');

        File.load('assets/test3').handle((outcome) -> switch(outcome) {
            case Success(bytes) : 
                trace('THREAD 2', tink.concurrent.Thread.current == tink.concurrent.Thread.MAIN);
                trace(bytes.length);
            case Failure(error) : trace('Cannot load!!!');
        });

        File.downloadString('http://www.sample-videos.com/csv/Sample-Spreadsheet-10-rows.csv').handle((outcome) -> switch(outcome) {
            case Success(text) : 
                trace('THREAD 3', tink.concurrent.Thread.current == tink.concurrent.Thread.MAIN);
                trace(text.length);
            case Failure(error) : trace('Cannot download!!!');
        });
        
        trace('22222');
    }

    // Main entry point
    static public function main() {
        new FileLoadSample();
    }
}

