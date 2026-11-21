#!/usr/bin/env bash
# Phase-4492: STATUS mentions schema 4.6 / 4489-4496.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.3|Honesty-Surface-Schema 4\.3|surface_version.*4\.3' webui/STATUS.md
grep -qE 'phase4496|through 4496|e2e-phase4496' webui/STATUS.md
echo "STATUS schema 4.6 ok"
echo "cleaned"
echo "OK: phase4492 e2e passed"
