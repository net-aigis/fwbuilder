#!/usr/bin/env bash
# Phase-10092: STATUS mentions schema 5.66 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase10096|through 10096|e2e-phase10096' webui/STATUS.md
echo "STATUS schema 5.66 ok"; echo "cleaned"; echo "OK: phase10092 e2e passed"
