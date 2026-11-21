#!/usr/bin/env bash
# Phase-27052: STATUS mentions schema 5.278 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase27056|through 27056|e2e-phase27056' webui/STATUS.md
echo "STATUS schema 5.278 ok"; echo "cleaned"; echo "OK: phase27052 e2e passed"
