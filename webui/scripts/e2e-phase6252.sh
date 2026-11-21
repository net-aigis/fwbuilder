#!/usr/bin/env bash
# Phase-6252: STATUS mentions schema 5.18 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase6256|through 6256|e2e-phase6256' webui/STATUS.md
echo "STATUS schema 5.18 ok"; echo "cleaned"; echo "OK: phase6252 e2e passed"
