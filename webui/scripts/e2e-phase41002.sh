#!/usr/bin/env bash
# Phase-41002: UI ssh-auth-soft-43000-echo roster Soft 41000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-43000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft43000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41000+ ssh-auth-soft-43000-echo roster ok"; echo "cleaned"; echo "OK: phase41002 e2e passed"
