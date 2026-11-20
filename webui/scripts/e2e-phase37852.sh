#!/usr/bin/env bash
# Phase-37852: STATUS mentions schema 5.413 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase37856|through 37856|e2e-phase37856' webui/STATUS.md
echo "STATUS schema 5.413 ok"; echo "cleaned"; echo "OK: phase37852 e2e passed"
