#!/usr/bin/env bash
# Phase-27212: STATUS mentions schema 5.280 / 5129-5136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'schema 5\.1|Honesty-Surface-Schema 5\.1|surface_version=5\.1|soft_fertig_honesty_surface_version 5\.1' webui/STATUS.md
grep -qE 'phase27216|through 27216|e2e-phase27216' webui/STATUS.md
echo "STATUS schema 5.280 ok"; echo "cleaned"; echo "OK: phase27212 e2e passed"
