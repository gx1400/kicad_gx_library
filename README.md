# GX KiCad Library

Personal collection of custom KiCad footprints, symbols, 3D models, and saved
component datasheets.

## Structure

```
footprints/GX.pretty/     Custom footprints (KiCad footprint library)
symbols/GX.kicad_sym      Custom symbols (KiCad symbol library)
3dmodels/GX.3dshapes/     3D models (.step / .igs) referenced by footprints
datasheets/               Saved component datasheets, grouped by manufacturer
```

## Adding this library in KiCad

1. Clone this repo somewhere on disk, e.g. `~/kicad/gx_library`.
2. In KiCad, open **Preferences > Manage Symbol Libraries** and add
   `symbols/GX.kicad_sym` as a new library (nickname `GX`).
3. Open **Preferences > Manage Footprint Libraries** and add
   `footprints/GX.pretty` as a new library (nickname `GX`).
4. For 3D models, footprints reference files relative to a configured
   environment variable. Set `GX_3DMODEL_DIR` (Preferences > Configure Paths)
   to the absolute path of `3dmodels/GX.3dshapes` in this repo, and reference
   models in footprints as `${GX_3DMODEL_DIR}/<model>.step`.

## Datasheets

Datasheets are organized by manufacturer under `datasheets/` for reference
when designing with these parts.
