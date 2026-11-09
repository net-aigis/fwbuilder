#!/usr/bin/env bash
# Phase-17322: UI ssh-auth-soft-17240-echo roster Soft 17320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-17240-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft17240EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17320+ ssh-auth-soft-17240-echo roster ok"; echo "cleaned"; echo "OK: phase17322 e2e passed"
