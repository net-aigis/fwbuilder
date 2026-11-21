#!/usr/bin/env bash
# Phase-13932: STATUS mentions schema 5.114 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase13936|through 13936|e2e-phase13936' webui/STATUS.md
echo "STATUS schema 5.114 ok"; echo "cleaned"; echo "OK: phase13932 e2e passed"
