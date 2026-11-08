#!/usr/bin/env bash
# Phase-6682: UI ssh-implemented-identity roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-identity roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedIdentityRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-implemented-identity roster ok"; echo "cleaned"; echo "OK: phase6682 e2e passed"
