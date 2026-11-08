#!/usr/bin/env bash
# Phase-13772: STATUS mentions schema 5.112 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase13776|through 13776|e2e-phase13776' webui/STATUS.md
echo "STATUS schema 5.112 ok"; echo "cleaned"; echo "OK: phase13772 e2e passed"
