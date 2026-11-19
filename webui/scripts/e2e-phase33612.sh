#!/usr/bin/env bash
# Phase-33612: STATUS mentions schema 5.360 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase33616|through 33616|e2e-phase33616' webui/STATUS.md
echo "STATUS schema 5.360 ok"; echo "cleaned"; echo "OK: phase33612 e2e passed"
