#!/usr/bin/env bash
# Phase-2412: STATUS mentions schema 2.0 / 2409-2416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 2\.0|Honesty-Surface-Schema 2\.0|surface_version.*2\.0' webui/STATUS.md
grep -qE 'phase2416|through 2416|e2e-phase2416' webui/STATUS.md
echo "STATUS schema 2.0 ok"
echo "cleaned"
echo "OK: phase2412 e2e passed"
