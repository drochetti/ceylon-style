import ceylon.style { ... }
import ceylon.style.type { ... }

Color defaultShadowColor = black.fadeTo(50);

shared Stylesheet widgets = Stylesheet {
	"button" -> Style {
		background = Background(black);
		padding = Box(5, 5, 5, 5);
    }
};

Integer defaultMargin = 10; // px

shared Stylesheet style = Stylesheet {

	StyleImport(widgets, false),

	"body" -> Style {
		background = black.fadeOut(80);
		padding = Box(5, 5, 5, 5);
		fontWeight = bold;
		value margin {
			value margin = defaultMargin * 1.5;
			return Box {
				top = defaultMargin; right = margin.integer;
				bottom = defaultMargin; left = margin.integer;
			};
		}
		nested = {
			"#header" -> Style {
				nested = {
					"&.selected" -> Style {
						
					}
				};
			}
		};
	}

};

/*
shared object widgets extends Stylesheet() {

	shared actual void define() {
		style("#wrapper", Style {
			padding = Box(5, 5, 5, 5);
		});
	}

}

shared object style extends Stylesheet() {

	shared actual void define() {

		addImport(widgets);

		style("#login", Style {
			border = Border(1);
			fontStyle = inherit;
			background = Background {
				color = black.fadeOut(20);
				position = leftTopPosition;
				repeat = repeatX;
			};
		});

	}

}
*/
