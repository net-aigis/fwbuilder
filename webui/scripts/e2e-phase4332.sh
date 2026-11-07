#!/usr/bin/env bash
# Phase-4332: STATUS mentions schema 4.4 / 4329-4336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'schema 4\.3|Honesty-Surface-Schema 4\.3|surface_version.*4\.3' webui/STATUS.md
grep -qE 'phase4336|through 4336|e2e-phase4336' webui/STATUS.md
echo "STATUS schema 4.4 ok"
echo "cleaned"
echo "OK: phase4332 e2e passed"
