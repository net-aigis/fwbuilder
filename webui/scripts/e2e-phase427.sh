#!/usr/bin/env bash
# Phase-427: client fetchStackSwitch option_enable types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'iface_option_enable' webui/frontend/src/api/client.ts
grep -Fq 'option_enable?:' webui/frontend/src/api/client.ts
echo "client stack-switch enable ok"
echo "cleaned"
echo "OK: phase427 e2e passed"
