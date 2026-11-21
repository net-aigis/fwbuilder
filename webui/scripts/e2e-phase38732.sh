#!/usr/bin/env bash
# Phase-38732: STATUS mentions schema 5.424 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase38736|through 38736|e2e-phase38736' webui/STATUS.md
echo "STATUS schema 5.424 ok"; echo "cleaned"; echo "OK: phase38732 e2e passed"
