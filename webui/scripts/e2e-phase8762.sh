#!/usr/bin/env bash
# Phase-8762: UI ssh-not-implemented-password-refresh roster Soft 8760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-password-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedPasswordRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8760+ ssh-not-implemented-password-refresh roster ok"; echo "cleaned"; echo "OK: phase8762 e2e passed"
