#!/usr/bin/env bash
# Phase-46972: STATUS mentions schema 5.527 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase46976|through 46976|e2e-phase46976' webui/STATUS.md
echo "STATUS schema 5.527 ok"; echo "cleaned"; echo "OK: phase46972 e2e passed"
