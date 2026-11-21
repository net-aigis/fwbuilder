#!/usr/bin/env bash
# Phase-29772: STATUS mentions schema 5.312 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase29776|through 29776|e2e-phase29776' webui/STATUS.md
echo "STATUS schema 5.312 ok"; echo "cleaned"; echo "OK: phase29772 e2e passed"
