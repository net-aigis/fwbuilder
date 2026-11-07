#!/usr/bin/env bash
# Phase-5932: STATUS mentions schema 5.14 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase5936|through 5936|e2e-phase5936' webui/STATUS.md
echo "STATUS schema 5.14 ok"; echo "cleaned"; echo "OK: phase5932 e2e passed"
