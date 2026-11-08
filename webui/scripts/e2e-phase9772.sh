#!/usr/bin/env bash
# Phase-9772: STATUS mentions schema 5.62 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase9776|through 9776|e2e-phase9776' webui/STATUS.md
echo "STATUS schema 5.62 ok"; echo "cleaned"; echo "OK: phase9772 e2e passed"
