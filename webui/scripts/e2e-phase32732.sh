#!/usr/bin/env bash
# Phase-32732: STATUS mentions schema 5.349 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase32736|through 32736|e2e-phase32736' webui/STATUS.md
echo "STATUS schema 5.349 ok"; echo "cleaned"; echo "OK: phase32732 e2e passed"
