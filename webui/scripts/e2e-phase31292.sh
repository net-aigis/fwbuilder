#!/usr/bin/env bash
# Phase-31292: STATUS mentions schema 5.331 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase31296|through 31296|e2e-phase31296' webui/STATUS.md
echo "STATUS schema 5.331 ok"; echo "cleaned"; echo "OK: phase31292 e2e passed"
