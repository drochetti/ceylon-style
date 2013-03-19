
shared class BoxShadow(horizontalOffset, verticalOffeset, color,
		blurRadius = 0, spreadRadius = 0, inset = false) {
	
	doc "The horizontal offset of the shadow, positive means the 
	     shadow will be on the right of the box, a negative offset 
	     will put the shadow on the left of the box."
	shared Integer horizontalOffset;
	
	doc "The vertical offset of the shadow, a negative one means
	     the box-shadow will be above the box, a positive one means
	     the shadow will be below the box."
	shared Integer verticalOffeset;
	
	doc "The color of the shadow."
	shared Color color;
	
	doc "If set to 0 the shadow will be sharp, the higher the
	     number, the more blurred it will be."
	shared Integer blurRadius;

	doc "Positive values increase the size of the shadow,
	     negative values decrease the size. Default is 0 (the
	     shadow is same size as blur)."
	shared Integer spreadRadius;

	shared Boolean inset;

}