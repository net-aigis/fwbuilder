#!/usr/bin/env bash
# Phase-382: STATUS documents fidelity stacked + /stack-switch 377–384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase377\|e2e-phase377' webui/STATUS.md
grep -q 'phase384\|e2e-phase384' webui/STATUS.md
grep -qi 'stack-switch\|stacked_sections' webui/STATUS.md
echo "STATUS 377-384 ok"
echo "cleaned"
echo "OK: phase382 e2e passed"
