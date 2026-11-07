#!/usr/bin/env bash
# Phase-4268: STATUS mentions option_enable_roster sessionStorage / 4265-4272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'option_enable_roster.*(sessionStorage|Clear)|sessionStorage.*option_enable_roster' webui/STATUS.md
grep -qE 'phase4272|through 4272|e2e-phase4272' webui/STATUS.md
echo "STATUS option_enable_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4268 e2e passed"
