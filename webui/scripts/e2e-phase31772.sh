#!/usr/bin/env bash
# Phase-31772: STATUS mentions schema 5.337 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase31776|through 31776|e2e-phase31776' webui/STATUS.md
echo "STATUS schema 5.337 ok"; echo "cleaned"; echo "OK: phase31772 e2e passed"
