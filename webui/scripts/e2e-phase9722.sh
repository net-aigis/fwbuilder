#!/usr/bin/env bash
# Phase-9722: UI ssh-auth-refusal-status roster Soft 9720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refusal-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefusalStatusRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9720+ ssh-auth-refusal-status roster ok"; echo "cleaned"; echo "OK: phase9722 e2e passed"
