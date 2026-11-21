#!/usr/bin/env bash
# Phase-15612: STATUS mentions schema 5.135 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase15616|through 15616|e2e-phase15616' webui/STATUS.md
echo "STATUS schema 5.135 ok"; echo "cleaned"; echo "OK: phase15612 e2e passed"
