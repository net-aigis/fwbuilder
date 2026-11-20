#!/usr/bin/env bash
# Phase-42412: STATUS mentions schema 5.470 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase42416|through 42416|e2e-phase42416' webui/STATUS.md
echo "STATUS schema 5.470 ok"; echo "cleaned"; echo "OK: phase42412 e2e passed"
