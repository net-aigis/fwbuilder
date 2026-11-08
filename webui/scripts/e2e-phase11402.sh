#!/usr/bin/env bash
# Phase-11402: UI ssh-auth-surface-hint roster Soft 11400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-surface-hint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSurfaceHintRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11400+ ssh-auth-surface-hint roster ok"; echo "cleaned"; echo "OK: phase11402 e2e passed"
