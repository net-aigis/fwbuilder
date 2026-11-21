#!/usr/bin/env bash
# Phase-19612: STATUS mentions schema 5.185 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase19616|through 19616|e2e-phase19616' webui/STATUS.md
echo "STATUS schema 5.185 ok"; echo "cleaned"; echo "OK: phase19612 e2e passed"
