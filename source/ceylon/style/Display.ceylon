
shared abstract class Display(mode)
        of block | inline | inlineBlock {
    shared String mode;
}

shared object block extends Display("block") {}

shared object inline extends Display("inline") {}

shared object inlineBlock extends Display("inline-block") {}
