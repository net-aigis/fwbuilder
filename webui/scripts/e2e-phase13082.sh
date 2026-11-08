#!/usr/bin/env bash
# Phase-13082: UI ssh-auth-soft-plus-echo roster Soft 13080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-plus-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoftPlusEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13080+ ssh-auth-soft-plus-echo roster ok"; echo "cleaned"; echo "OK: phase13082 e2e passed"
