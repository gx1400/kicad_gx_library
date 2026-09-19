# GX KiCad Library

Personal collection of custom KiCad footprints, symbols, 3D models, and saved
component datasheets.

## Structure

```
GX.kicad_sym      Custom symbols (KiCad symbol library)
GX.pretty/        Custom footprints (KiCad footprint library)
GX.3dshapes/      3D models (.step / .igs) referenced by footprints
datasheets/       Saved component datasheets, grouped by manufacturer
```

Symbol, footprint, and 3D-model files are colocated under one shared `GX` base name
deliberately — this is the layout `easyeda2kicad` assumes by default
(`--output=path/to/GX` writes `GX.kicad_sym` + `GX.pretty/` + `GX.3dshapes/` directly in
one shot), so pulling in new LCSC/EasyEDA parts needs no extra staging or path-fixing step.

## Adding this library in KiCad

1. Clone this repo somewhere on disk, e.g. `~/kicad/gx_library`.
2. In KiCad, open **Preferences > Manage Symbol Libraries** and add `GX.kicad_sym` as a
   new library (nickname `GX`).
3. Open **Preferences > Manage Footprint Libraries** and add `GX.pretty` as a new library
   (nickname `GX`).
4. For 3D models, generate/reference footprints with a `${KIPRJMOD}`-relative path to
   `GX.3dshapes` (e.g. `easyeda2kicad --project-relative`) rather than a global environment
   variable — this keeps the library working out of the box for any project that vendors it
   as a submodule under `<project>/pcb/libs/kicad_gx_library`, with no per-machine path
   configuration required.

## Adding a new part from LCSC/EasyEDA

```bash
easyeda2kicad --full --lcsc_id=<LCSC_ID> --project-relative \
  --output=<path-to-this-repo>/GX
```

This appends the new symbol into `GX.kicad_sym` and adds the footprint/3D model into
`GX.pretty/` / `GX.3dshapes/` — safe to re-run against the same `GX` base for every new
part.

## Datasheets

Datasheets are organized by manufacturer under `datasheets/` for reference
when designing with these parts.
