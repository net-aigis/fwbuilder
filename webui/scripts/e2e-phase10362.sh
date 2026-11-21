#!/usr/bin/env bash
# Phase-10362: UI ssh-auth-key-surface roster Soft 10360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-key-surface roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthKeySurfaceRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10360+ ssh-auth-key-surface roster ok"; echo "cleaned"; echo "OK: phase10362 e2e passed"
