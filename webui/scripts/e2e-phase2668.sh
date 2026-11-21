#!/usr/bin/env bash
# Phase-2668: STATUS mentions honesty_bundle_roster sessionStorage / 2665-2672.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_bundle_roster.*(sessionStorage|Clear)|sessionStorage.*honesty_bundle_roster' webui/STATUS.md
grep -qE 'phase2672|through 2672|e2e-phase2672' webui/STATUS.md
echo "STATUS honesty_bundle_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2668 e2e passed"
