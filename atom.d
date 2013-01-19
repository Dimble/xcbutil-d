module interim.xcbutil.atom;

import interim.xcb.xcb;

extern(System) {

char *xcb_atom_name_by_screen (const char *base, ubyte screen);
char *xcb_atom_name_by_resource (const char *base, uint resource);
char *xcb_atom_name_unique (const char *base, uint id);

}
