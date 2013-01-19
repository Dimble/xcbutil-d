module interim.xcbutil.aux;

import interim.xcb.xcb;

extern(System)
{

ubyte xcb_aux_get_depth (xcb_connection_t *c,
                         xcb_screen_t     *screen);

ubyte xcb_aux_get_depth_of_visual (xcb_screen_t  *screen,
                                   xcb_visualid_t id);

xcb_screen_t *xcb_aux_get_screen (xcb_connection_t *c,
                                  int               screen);

xcb_visualtype_t *xcb_aux_get_visualtype (xcb_connection_t *c,
                                          int               screen,
                                          xcb_visualid_t    vid);

xcb_visualtype_t *
xcb_aux_find_visual_by_id (xcb_screen_t  *screen,
                           xcb_visualid_t id);

xcb_visualtype_t *
xcb_aux_find_visual_by_attrs (xcb_screen_t *screen,
                              byte          class_,
			      byte          depth);

void xcb_aux_sync (xcb_connection_t *c);

/+

/* internal helper macro for XCB_AUX_ADD_PARAM
It gives the offset of the field 'param' in the structure pointed to by
'paramsp' in multiples of an uint's size. */
#define XCB_AUX_INTERNAL_OFFSETOF(paramsp, param) \
    ((uint const*)(&((paramsp)->param))-(uint const*)(paramsp))

/* add an optional parameter to an xcb_params_* structure
parameters:
    maskp: pointer to bitmask whos bits mark used parameters
    paramsp: pointer to structure with parameters
    param: parameter to set
    value: value to set the parameter to
*/
#define XCB_AUX_ADD_PARAM(maskp, paramsp, param, value) \
    ((*(maskp)|=1<<XCB_AUX_INTERNAL_OFFSETOF((paramsp),param)), \
     ((paramsp)->param=(value)))

+/

struct xcb_params_cw_t {
    uint back_pixmap;
    uint back_pixel;
    uint border_pixmap;
    uint border_pixel;
    uint bit_gravity;
    uint win_gravity;
    uint backing_store;
    uint backing_planes;
    uint backing_pixel;
    uint override_redirect;
    uint save_under;
    uint event_mask;
    uint dont_propagate;
    uint colormap;
    uint cursor;
}

xcb_void_cookie_t
xcb_aux_create_window (xcb_connection_t      *c,
                       ubyte                  depth,
                       xcb_window_t           wid,
                       xcb_window_t           parent,
                       short                  x,
                       short                  y,
                       ushort                 width,
                       ushort                 height,
                       ushort                 border_width,
                       ushort                 class_,
                       xcb_visualid_t         visual,
                       uint                   mask,
                       const xcb_params_cw_t *params);

xcb_void_cookie_t
xcb_aux_create_window_checked (xcb_connection_t      *c,
			       ubyte                  depth,
			       xcb_window_t           wid,
			       xcb_window_t           parent,
			       short                  x,
			       short                  y,
			       ushort                 width,
			       ushort                 height,
			       ushort                 border_width,
			       ushort                 class_,
			       xcb_visualid_t         visual,
			       uint                   mask,
			       const xcb_params_cw_t *params);

xcb_void_cookie_t
xcb_aux_change_window_attributes (xcb_connection_t      *c,
                                  xcb_window_t           window,
                                  uint                   mask,
                                  const xcb_params_cw_t *params);

xcb_void_cookie_t
xcb_aux_change_window_attributes_checked (xcb_connection_t      *c,
                                          xcb_window_t           window,
                                          uint                   mask,
                                          const xcb_params_cw_t *params);

struct xcb_params_configure_window_t {
    int  x;
    int  y;
    uint width;
    uint height;
    uint border_width;
    uint sibling;
    uint stack_mode;
}

xcb_void_cookie_t
xcb_aux_configure_window (xcb_connection_t                    *c,
                          xcb_window_t                         window,
                          ushort                               mask,
                          const xcb_params_configure_window_t *params);

struct xcb_params_gc_t {
    uint function_;
    uint plane_mask;
    uint foreground;
    uint background;
    uint line_width;
    uint line_style;
    uint cap_style;
    uint join_style;
    uint fill_style;
    uint fill_rule;
    uint tile;
    uint stipple;
    uint tile_stipple_origin_x;
    uint tile_stipple_origin_y;
    uint font;
    uint subwindow_mode;
    uint graphics_exposures;
    uint clip_originX;
    uint clip_originY;
    uint mask;
    uint dash_offset;
    uint dash_list;
    uint arc_mode;
}

xcb_void_cookie_t
xcb_aux_create_gc (xcb_connection_t      *c,
                   xcb_gcontext_t         cid,
                   xcb_drawable_t         drawable,
                   uint                   mask,
                   const xcb_params_gc_t *params);

xcb_void_cookie_t
xcb_aux_create_gc_checked (xcb_connection_t      *c,
			   xcb_gcontext_t         gid,
			   xcb_drawable_t         drawable,
			   uint                   mask,
			   const xcb_params_gc_t *params);
xcb_void_cookie_t
xcb_aux_change_gc (xcb_connection_t      *c,
                   xcb_gcontext_t         gc,
                   uint                   mask,
                   const xcb_params_gc_t *params);

xcb_void_cookie_t
xcb_aux_change_gc_checked (xcb_connection_t      *c,
			   xcb_gcontext_t         gc,
			   uint                   mask,
			   const xcb_params_gc_t *params);

struct xcb_params_keyboard_t {
    uint key_click_percent;
    uint bell_percent;
    uint bell_pitch;
    uint bell_duration;
    uint led;
    uint led_mode;
    uint key;
    uint auto_repeat_mode;
}

xcb_void_cookie_t
xcb_aux_change_keyboard_control (xcb_connection_t            *c,
                                 uint                         mask,
                                 const xcb_params_keyboard_t *params);

int
xcb_aux_parse_color (char *color_name,
		     ushort *red,  ushort *green,  ushort *blue);

xcb_void_cookie_t
xcb_aux_set_line_attributes_checked (xcb_connection_t *dpy,
				     xcb_gcontext_t    gc,
				     ushort            linewidth,
				     int               linestyle,
				     int               capstyle,
				     int               joinstyle);

xcb_void_cookie_t
xcb_aux_clear_window (xcb_connection_t *  dpy,
		      xcb_window_t        w);

}  // extern(System)

