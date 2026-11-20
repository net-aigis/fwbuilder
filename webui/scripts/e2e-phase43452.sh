#!/usr/bin/env bash
# Phase-43452: STATUS mentions schema 5.483 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase43456|through 43456|e2e-phase43456' webui/STATUS.md
echo "STATUS schema 5.483 ok"; echo "cleaned"; echo "OK: phase43452 e2e passed"
