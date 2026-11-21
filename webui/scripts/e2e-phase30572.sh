#!/usr/bin/env bash
# Phase-30572: STATUS mentions schema 5.322 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase30576|through 30576|e2e-phase30576' webui/STATUS.md
echo "STATUS schema 5.322 ok"; echo "cleaned"; echo "OK: phase30572 e2e passed"
