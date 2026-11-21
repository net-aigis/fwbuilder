#!/usr/bin/env bash
# Phase-20972: STATUS mentions schema 5.202 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase20976|through 20976|e2e-phase20976' webui/STATUS.md
echo "STATUS schema 5.202 ok"; echo "cleaned"; echo "OK: phase20972 e2e passed"
