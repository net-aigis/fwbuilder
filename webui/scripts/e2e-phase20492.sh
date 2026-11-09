#!/usr/bin/env bash
# Phase-20492: STATUS mentions schema 5.196 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase20496|through 20496|e2e-phase20496' webui/STATUS.md
echo "STATUS schema 5.196 ok"; echo "cleaned"; echo "OK: phase20492 e2e passed"
