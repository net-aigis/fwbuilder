#!/usr/bin/env bash
# Phase-323: STATUS mentions rule/iface fidelity headers.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'RuleOptions\|InterfaceOptions\|fidelity' webui/STATUS.md
grep -q 'phase323\|phase322\|phase321' webui/STATUS.md
echo "STATUS 321+ mentions ok"
echo "cleaned"
echo "OK: phase323 e2e passed"
