if (!view_enabled) {
		view_set_wport(0, global.gameWidth);
		view_set_hport(0, global.gameHeight);
		view_set_visible(0, true);
		view_enabled = true;
}

if (window_get_width() != global.gameWidth*global.zoom
&&  window_get_height() != global.gameHeight*global.zoom) {
	window_set_size(global.gameWidth*global.zoom, global.gameHeight*global.zoom);
	surface_resize(application_surface, global.gameWidth*global.resolution, global.gameHeight*global.resolution);
	display_set_gui_size(global.gameWidth * 2, global.gameHeight * 2);
}