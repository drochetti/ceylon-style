import ceylon.style.sample { ConsoleStylesheetSerializer, sampleStyles }
import ceylon.style.serializer { StylesheetSerializer }

doc "Run the module `ceylon.style`."
void run() {
    StylesheetSerializer serializer = ConsoleStylesheetSerializer(sampleStyles);
    serializer.serialize();
}