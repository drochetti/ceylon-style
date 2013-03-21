import ceylon.style.serializer { StylesheetSerializer }
import ceylon.style.sample { ConsoleStylesheetSerializer, sampleStyles }

doc "Run the module `ceylon.style`."
void run() {
    StylesheetSerializer serializer = ConsoleStylesheetSerializer(sampleStyles);
    serializer.serialize();
}