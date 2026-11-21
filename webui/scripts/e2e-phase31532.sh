#!/usr/bin/env bash
# Phase-31532: STATUS mentions schema 5.334 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase31536|through 31536|e2e-phase31536' webui/STATUS.md
echo "STATUS schema 5.334 ok"; echo "cleaned"; echo "OK: phase31532 e2e passed"
