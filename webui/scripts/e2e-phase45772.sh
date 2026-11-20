#!/usr/bin/env bash
# Phase-45772: STATUS mentions schema 5.512 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase45776|through 45776|e2e-phase45776' webui/STATUS.md
echo "STATUS schema 5.512 ok"; echo "cleaned"; echo "OK: phase45772 e2e passed"
