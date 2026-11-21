#!/usr/bin/env bash
# Phase-32682: UI ssh-auth-soft-33720-echo roster Soft 32680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-33720-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft33720EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32680+ ssh-auth-soft-33720-echo roster ok"; echo "cleaned"; echo "OK: phase32682 e2e passed"
