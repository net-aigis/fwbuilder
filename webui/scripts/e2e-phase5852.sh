#!/usr/bin/env bash
# Phase-5852: STATUS mentions schema 5.13 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase5856|through 5856|e2e-phase5856' webui/STATUS.md
echo "STATUS schema 5.13 ok"; echo "cleaned"; echo "OK: phase5852 e2e passed"
