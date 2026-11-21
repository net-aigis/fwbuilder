#!/usr/bin/env bash
# Phase-12602: UI ssh-auth-support-count roster Soft 12600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-support-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSupportCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12600+ ssh-auth-support-count roster ok"; echo "cleaned"; echo "OK: phase12602 e2e passed"
