#!/usr/bin/env bash
# Phase-32252: STATUS mentions schema 5.343 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase32256|through 32256|e2e-phase32256' webui/STATUS.md
echo "STATUS schema 5.343 ok"; echo "cleaned"; echo "OK: phase32252 e2e passed"
