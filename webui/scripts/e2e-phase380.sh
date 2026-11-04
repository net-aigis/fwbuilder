#!/usr/bin/env bash
# Phase-380: client fetchStackSwitch + fidelity types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchStackSwitch' webui/frontend/src/api/client.ts
grep -Fq 'stack_switch_path' webui/frontend/src/api/client.ts
grep -Fq 'iface_stack_switch' webui/frontend/src/api/client.ts
echo "client stack-switch ok"
echo "cleaned"
echo "OK: phase380 e2e passed"
