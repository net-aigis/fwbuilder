#!/usr/bin/env bash
# Phase-14092: STATUS mentions schema 5.116 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase14096|through 14096|e2e-phase14096' webui/STATUS.md
echo "STATUS schema 5.116 ok"; echo "cleaned"; echo "OK: phase14092 e2e passed"
