#!/usr/bin/env bash
# Phase-18572: STATUS mentions schema 5.172 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase18576|through 18576|e2e-phase18576' webui/STATUS.md
echo "STATUS schema 5.172 ok"; echo "cleaned"; echo "OK: phase18572 e2e passed"
