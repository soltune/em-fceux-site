#!/bin/bash
# Build em-fceux (fceux.js/fceux.wasm) from the local FCEUX checkout.
#
# Environment:
#   FCEUX_DIR  FCEUX checkout (default: ../fceux, https://github.com/soltune/fceux)
#   EMSDK_DIR  emsdk used when EMSDK is not already set (default: ../emsdk)
#
# Extra arguments (e.g. --debug, --clean) are passed to build-emscripten.sh.
set -eEuo pipefail
SITE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
FCEUX_DIR="${FCEUX_DIR:-$SITE_DIR/../fceux}"
EM_DIR="$FCEUX_DIR/src/drivers/em"

if [ ! -x "$EM_DIR/scripts/build-emscripten.sh" ]; then
  echo >&2 "ERROR: em-fceux not found at $EM_DIR."
  echo >&2 "Clone https://github.com/soltune/fceux to ../fceux or set FCEUX_DIR."
  exit 1
fi

if [ -z "${EMSDK+x}" ]; then
  EMSDK_DIR="${EMSDK_DIR:-$SITE_DIR/../emsdk}"
  if [ ! -f "$EMSDK_DIR/emsdk_env.sh" ]; then
    echo >&2 "ERROR: emsdk not found at $EMSDK_DIR. Set EMSDK_DIR or source emsdk_env.sh."
    exit 1
  fi
  set +u
  source "$EMSDK_DIR/emsdk_env.sh" > /dev/null 2>&1
  set -u
fi

"$EM_DIR/scripts/build-emscripten.sh" "$@"
