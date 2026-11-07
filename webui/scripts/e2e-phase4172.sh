#!/usr/bin/env bash
# Phase-4172: STATUS mentions schema 4.2 / 4169-4176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.2|Honesty-Surface-Schema 4\.2|surface_version.*4\.2' webui/STATUS.md
grep -qE 'phase4176|through 4176|e2e-phase4176' webui/STATUS.md
echo "STATUS schema 4.2 ok"
echo "cleaned"
echo "OK: phase4172 e2e passed"
