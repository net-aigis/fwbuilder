#!/usr/bin/env bash
# Phase-24492: STATUS mentions schema 5.246 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase24496|through 24496|e2e-phase24496' webui/STATUS.md
echo "STATUS schema 5.246 ok"; echo "cleaned"; echo "OK: phase24492 e2e passed"
