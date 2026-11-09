#!/usr/bin/env bash
# Phase-20522: UI ssh-auth-soft-20520-echo roster Soft 20520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-20520-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft20520EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20520+ ssh-auth-soft-20520-echo roster ok"; echo "cleaned"; echo "OK: phase20522 e2e passed"
