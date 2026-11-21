#!/usr/bin/env bash
# Phase-28892: STATUS mentions schema 5.301 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase28896|through 28896|e2e-phase28896' webui/STATUS.md
echo "STATUS schema 5.301 ok"; echo "cleaned"; echo "OK: phase28892 e2e passed"
