#!/usr/bin/env bash
# Pull one or more parts from LCSC/EasyEDA into this library, auto-tagged with
# Source and Imported-date properties for traceability.
#
# Usage:
#   ./add_part.sh <LCSC_ID> [LCSC_ID ...]
# Example:
#   ./add_part.sh C485916

set -euo pipefail

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <LCSC_ID> [LCSC_ID ...]" >&2
    echo "Example: $0 C485916" >&2
    exit 1
fi

if ! command -v easyeda2kicad >/dev/null 2>&1; then
    echo "easyeda2kicad not found on PATH. Install with: pip install easyeda2kicad" >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TODAY="$(date +%Y-%m-%d)"

# Nickname this library is registered under in a consuming project's fp-lib-table.
# easyeda2kicad always prefixes the symbol's Footprint property with its --output
# basename ("GX"), which won't match unless the library happens to be registered
# under that exact nickname — fix it up below so footprints resolve out of the box.
FP_LIB_NICKNAME="kicad_gx_library"

easyeda2kicad --full --lcsc_id "$@" --project-relative \
    --custom-field "Source:easyeda2kicad" "Imported:$TODAY" \
    --output="$SCRIPT_DIR/GX"

sed -i "s/\"GX:/\"${FP_LIB_NICKNAME}:/" "$SCRIPT_DIR/GX.kicad_sym"

echo "Done — appended into $SCRIPT_DIR/GX.kicad_sym, GX.pretty/, GX.3dshapes/"
