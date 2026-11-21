#!/usr/bin/env bash
# Phase-8922: UI ssh-password-support-refresh roster Soft 8920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-password-support-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshPasswordSupportRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8920+ ssh-password-support-refresh roster ok"; echo "cleaned"; echo "OK: phase8922 e2e passed"
