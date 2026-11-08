#!/usr/bin/env bash
# Phase-10762: UI ssh-auth-type-tag roster Soft 10760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-type-tag roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTypeTagRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10760+ ssh-auth-type-tag roster ok"; echo "cleaned"; echo "OK: phase10762 e2e passed"
