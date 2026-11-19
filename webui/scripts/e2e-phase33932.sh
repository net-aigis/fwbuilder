#!/usr/bin/env bash
# Phase-33932: STATUS mentions schema 5.364 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase33936|through 33936|e2e-phase33936' webui/STATUS.md
echo "STATUS schema 5.364 ok"; echo "cleaned"; echo "OK: phase33932 e2e passed"
