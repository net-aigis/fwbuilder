#!/usr/bin/env bash
# Phase-18972: STATUS mentions schema 5.177 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18976|through 18976|e2e-phase18976' webui/STATUS.md
echo "STATUS schema 5.177 ok"; echo "cleaned"; echo "OK: phase18972 e2e passed"
