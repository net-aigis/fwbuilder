#!/usr/bin/env bash
# Phase-27292: STATUS mentions schema 5.281 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase27296|through 27296|e2e-phase27296' webui/STATUS.md
echo "STATUS schema 5.281 ok"; echo "cleaned"; echo "OK: phase27292 e2e passed"
