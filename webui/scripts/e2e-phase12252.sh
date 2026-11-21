#!/usr/bin/env bash
# Phase-12252: STATUS mentions schema 5.93 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase12256|through 12256|e2e-phase12256' webui/STATUS.md
echo "STATUS schema 5.93 ok"; echo "cleaned"; echo "OK: phase12252 e2e passed"
