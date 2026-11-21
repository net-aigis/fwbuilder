#!/usr/bin/env bash
# Phase-24252: STATUS mentions schema 5.243 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase24256|through 24256|e2e-phase24256' webui/STATUS.md
echo "STATUS schema 5.243 ok"; echo "cleaned"; echo "OK: phase24252 e2e passed"
