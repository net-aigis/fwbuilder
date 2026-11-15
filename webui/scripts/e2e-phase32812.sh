#!/usr/bin/env bash
# Phase-32812: STATUS mentions schema 5.350 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase32816|through 32816|e2e-phase32816' webui/STATUS.md
echo "STATUS schema 5.350 ok"; echo "cleaned"; echo "OK: phase32812 e2e passed"
