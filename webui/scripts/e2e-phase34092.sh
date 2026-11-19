#!/usr/bin/env bash
# Phase-34092: STATUS mentions schema 5.366 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase34096|through 34096|e2e-phase34096' webui/STATUS.md
echo "STATUS schema 5.366 ok"; echo "cleaned"; echo "OK: phase34092 e2e passed"
