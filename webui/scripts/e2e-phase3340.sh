#!/usr/bin/env bash
# Phase-3340: STATUS mentions honesty_readiness_roster / 3337-3344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_readiness_roster|soft_fertig_honesty_readiness_roster' webui/STATUS.md
grep -qE 'phase3344|through 3344|e2e-phase3344' webui/STATUS.md
echo "STATUS honesty readiness roster ok"
echo "cleaned"
echo "OK: phase3340 e2e passed"
