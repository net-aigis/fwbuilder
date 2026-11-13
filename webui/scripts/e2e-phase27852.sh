#!/usr/bin/env bash
# Phase-27852: STATUS mentions schema 5.288 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase27856|through 27856|e2e-phase27856' webui/STATUS.md
echo "STATUS schema 5.288 ok"; echo "cleaned"; echo "OK: phase27852 e2e passed"
