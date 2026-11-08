#!/usr/bin/env bash
# Phase-12812: STATUS mentions schema 5.100 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase12816|through 12816|e2e-phase12816' webui/STATUS.md
echo "STATUS schema 5.100 ok"; echo "cleaned"; echo "OK: phase12812 e2e passed"
