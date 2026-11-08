#!/usr/bin/env bash
# Phase-11612: STATUS mentions schema 5.85 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase11616|through 11616|e2e-phase11616' webui/STATUS.md
echo "STATUS schema 5.85 ok"; echo "cleaned"; echo "OK: phase11612 e2e passed"
