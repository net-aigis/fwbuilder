#!/usr/bin/env bash
# Phase-2332: STATUS mentions schema 1.9 / 2329-2336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 1\.9|Honesty-Surface-Schema 1\.9|surface_version.*1\.9' webui/STATUS.md
grep -qE 'phase2336|through 2336|e2e-phase2336' webui/STATUS.md
echo "STATUS schema 1.9 ok"
echo "cleaned"
echo "OK: phase2332 e2e passed"
