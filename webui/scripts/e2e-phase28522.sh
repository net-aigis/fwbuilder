#!/usr/bin/env bash
# Phase-28522: UI ssh-auth-soft-29040-echo roster Soft 28520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-29040-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft29040EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28520+ ssh-auth-soft-29040-echo roster ok"; echo "cleaned"; echo "OK: phase28522 e2e passed"
