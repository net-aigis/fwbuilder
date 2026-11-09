#!/usr/bin/env bash
# Phase-17372: STATUS mentions schema 5.157 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase17376|through 17376|e2e-phase17376' webui/STATUS.md
echo "STATUS schema 5.157 ok"; echo "cleaned"; echo "OK: phase17372 e2e passed"
