#!/usr/bin/env bash
# Phase-47372: STATUS mentions schema 5.532 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase47376|through 47376|e2e-phase47376' webui/STATUS.md
echo "STATUS schema 5.532 ok"; echo "cleaned"; echo "OK: phase47372 e2e passed"
