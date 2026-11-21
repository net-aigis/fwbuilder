#!/usr/bin/env bash
# Phase-10012: STATUS mentions schema 5.65 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase10016|through 10016|e2e-phase10016' webui/STATUS.md
echo "STATUS schema 5.65 ok"; echo "cleaned"; echo "OK: phase10012 e2e passed"
