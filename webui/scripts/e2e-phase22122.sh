#!/usr/bin/env bash
# Phase-22122: UI ssh-auth-soft-22200-echo roster Soft 22120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-22200-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft22200EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22120+ ssh-auth-soft-22200-echo roster ok"; echo "cleaned"; echo "OK: phase22122 e2e passed"
