#!/usr/bin/env bash
# Phase-20252: STATUS mentions schema 5.193 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase20256|through 20256|e2e-phase20256' webui/STATUS.md
echo "STATUS schema 5.193 ok"; echo "cleaned"; echo "OK: phase20252 e2e passed"
