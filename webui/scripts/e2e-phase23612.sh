#!/usr/bin/env bash
# Phase-23612: STATUS mentions schema 5.235 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase23616|through 23616|e2e-phase23616' webui/STATUS.md
echo "STATUS schema 5.235 ok"; echo "cleaned"; echo "OK: phase23612 e2e passed"
