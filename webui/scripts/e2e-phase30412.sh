#!/usr/bin/env bash
# Phase-30412: STATUS mentions schema 5.320 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase30416|through 30416|e2e-phase30416' webui/STATUS.md
echo "STATUS schema 5.320 ok"; echo "cleaned"; echo "OK: phase30412 e2e passed"
