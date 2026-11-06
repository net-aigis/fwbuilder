#!/usr/bin/env bash
# Phase-4012: STATUS mentions schema 4.0 / 4009-4016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.0|Honesty-Surface-Schema 4\.0|surface_version.*4\.0' webui/STATUS.md
grep -qE 'phase4016|through 4016|e2e-phase4016' webui/STATUS.md
echo "STATUS schema 4.0 ok"
echo "cleaned"
echo "OK: phase4012 e2e passed"
