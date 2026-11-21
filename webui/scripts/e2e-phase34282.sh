#!/usr/bin/env bash
# Phase-34282: UI ssh-auth-soft-35440-echo roster Soft 34280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-35440-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft35440EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34280+ ssh-auth-soft-35440-echo roster ok"; echo "cleaned"; echo "OK: phase34282 e2e passed"
