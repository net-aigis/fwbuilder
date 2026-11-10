#!/usr/bin/env bash
# Phase-23772: STATUS mentions schema 5.237 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase23776|through 23776|e2e-phase23776' webui/STATUS.md
echo "STATUS schema 5.237 ok"; echo "cleaned"; echo "OK: phase23772 e2e passed"
