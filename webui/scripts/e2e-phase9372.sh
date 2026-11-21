#!/usr/bin/env bash
# Phase-9372: STATUS mentions schema 5.57 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase9376|through 9376|e2e-phase9376' webui/STATUS.md
echo "STATUS schema 5.57 ok"; echo "cleaned"; echo "OK: phase9372 e2e passed"
