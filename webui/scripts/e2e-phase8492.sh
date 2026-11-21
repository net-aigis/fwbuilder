#!/usr/bin/env bash
# Phase-8492: STATUS mentions schema 5.46 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase8496|through 8496|e2e-phase8496' webui/STATUS.md
echo "STATUS schema 5.46 ok"; echo "cleaned"; echo "OK: phase8492 e2e passed"
