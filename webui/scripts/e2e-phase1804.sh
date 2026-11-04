#!/usr/bin/env bash
# Phase-1804: STATUS mentions schema 1.1 / 1801-1808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 1\.1|surface_version.?1\.1|honesty_surface_version.?1\.1' webui/STATUS.md
grep -qE 'phase1808|through 1808|e2e-phase1808' webui/STATUS.md
echo "STATUS schema 1.1 ok"
echo "cleaned"
echo "OK: phase1804 e2e passed"
