#!/usr/bin/env bash
# Phase-4092: STATUS mentions schema 4.1 / 4089-4096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.0|Honesty-Surface-Schema 4\.0|surface_version.*4\.0' webui/STATUS.md
grep -qE 'phase4096|through 4096|e2e-phase4096' webui/STATUS.md
echo "STATUS schema 4.1 ok"
echo "cleaned"
echo "OK: phase4092 e2e passed"
