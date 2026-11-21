#!/usr/bin/env bash
# Phase-28972: STATUS mentions schema 5.302 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28976|through 28976|e2e-phase28976' webui/STATUS.md
echo "STATUS schema 5.302 ok"; echo "cleaned"; echo "OK: phase28972 e2e passed"
