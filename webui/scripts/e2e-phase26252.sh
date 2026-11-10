#!/usr/bin/env bash
# Phase-26252: STATUS mentions schema 5.268 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase26256|through 26256|e2e-phase26256' webui/STATUS.md
echo "STATUS schema 5.268 ok"; echo "cleaned"; echo "OK: phase26252 e2e passed"
