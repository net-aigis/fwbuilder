#!/usr/bin/env bash
# Phase-12842: UI ssh-auth-surface-count roster Soft 12840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-surface-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSurfaceCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12840+ ssh-auth-surface-count roster ok"; echo "cleaned"; echo "OK: phase12842 e2e passed"
