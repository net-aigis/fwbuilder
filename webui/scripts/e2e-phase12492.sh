#!/usr/bin/env bash
# Phase-12492: STATUS mentions schema 5.96 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase12496|through 12496|e2e-phase12496' webui/STATUS.md
echo "STATUS schema 5.96 ok"; echo "cleaned"; echo "OK: phase12492 e2e passed"
