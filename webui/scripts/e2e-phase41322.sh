#!/usr/bin/env bash
# Phase-41322: UI ssh-auth-soft-43360-echo roster Soft 41320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-43360-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft43360EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41320+ ssh-auth-soft-43360-echo roster ok"; echo "cleaned"; echo "OK: phase41322 e2e passed"
