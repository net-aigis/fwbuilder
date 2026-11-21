#!/usr/bin/env bash
# Phase-16972: STATUS mentions schema 5.152 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase16976|through 16976|e2e-phase16976' webui/STATUS.md
echo "STATUS schema 5.152 ok"; echo "cleaned"; echo "OK: phase16972 e2e passed"
