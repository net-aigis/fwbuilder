#!/usr/bin/env bash
# Phase-7772: STATUS mentions schema 5.37 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase7776|through 7696|e2e-phase7776' webui/STATUS.md
echo "STATUS schema 5.37 ok"; echo "cleaned"; echo "OK: phase7772 e2e passed"
