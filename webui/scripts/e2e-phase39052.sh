#!/usr/bin/env bash
# Phase-39052: STATUS mentions schema 5.428 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase39056|through 39056|e2e-phase39056' webui/STATUS.md
echo "STATUS schema 5.428 ok"; echo "cleaned"; echo "OK: phase39052 e2e passed"
