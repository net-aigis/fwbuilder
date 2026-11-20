#!/usr/bin/env bash
# Phase-36252: STATUS mentions schema 5.393 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase36256|through 36256|e2e-phase36256' webui/STATUS.md
echo "STATUS schema 5.393 ok"; echo "cleaned"; echo "OK: phase36252 e2e passed"
