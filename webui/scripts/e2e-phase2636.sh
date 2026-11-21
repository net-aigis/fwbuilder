#!/usr/bin/env bash
# Phase-2636: STATUS mentions honesty_bundle_roster export / 2633-2640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_bundle_roster.*(export|bundle)|export.*honesty_bundle_roster|bundle.*honesty_bundle_roster' webui/STATUS.md
grep -qE 'phase2640|through 2640|e2e-phase2640' webui/STATUS.md
echo "STATUS honesty_bundle_roster export ok"
echo "cleaned"
echo "OK: phase2636 e2e passed"
