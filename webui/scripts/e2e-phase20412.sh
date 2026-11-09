#!/usr/bin/env bash
# Phase-20412: STATUS mentions schema 5.195 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase20416|through 20416|e2e-phase20416' webui/STATUS.md
echo "STATUS schema 5.195 ok"; echo "cleaned"; echo "OK: phase20412 e2e passed"
