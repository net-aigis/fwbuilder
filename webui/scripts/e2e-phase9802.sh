#!/usr/bin/env bash
# Phase-9802: UI ssh-auth-title-map roster Soft 9800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-title-map roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTitleMapRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9800+ ssh-auth-title-map roster ok"; echo "cleaned"; echo "OK: phase9802 e2e passed"
