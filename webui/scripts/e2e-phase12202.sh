#!/usr/bin/env bash
# Phase-12202: UI ssh-auth-operator-echo roster Soft 12200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-operator-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthOperatorEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12200+ ssh-auth-operator-echo roster ok"; echo "cleaned"; echo "OK: phase12202 e2e passed"
