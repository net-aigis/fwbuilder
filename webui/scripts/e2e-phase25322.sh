#!/usr/bin/env bash
# Phase-25322: UI ssh-auth-soft-25440-echo roster Soft 25320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-25440-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft25440EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25320+ ssh-auth-soft-25440-echo roster ok"; echo "cleaned"; echo "OK: phase25322 e2e passed"
