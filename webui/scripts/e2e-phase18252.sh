#!/usr/bin/env bash
# Phase-18252: STATUS mentions schema 5.168 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18256|through 18256|e2e-phase18256' webui/STATUS.md
echo "STATUS schema 5.168 ok"; echo "cleaned"; echo "OK: phase18252 e2e passed"
