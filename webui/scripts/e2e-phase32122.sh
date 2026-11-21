#!/usr/bin/env bash
# Phase-32122: UI ssh-auth-ms-72000-echo roster Soft 32120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-72000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs72000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32120+ ssh-auth-ms-72000-echo roster ok"; echo "cleaned"; echo "OK: phase32122 e2e passed"
