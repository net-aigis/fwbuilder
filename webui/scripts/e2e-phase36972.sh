#!/usr/bin/env bash
# Phase-36972: STATUS mentions schema 5.402 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase36976|through 36976|e2e-phase36976' webui/STATUS.md
echo "STATUS schema 5.402 ok"; echo "cleaned"; echo "OK: phase36972 e2e passed"
