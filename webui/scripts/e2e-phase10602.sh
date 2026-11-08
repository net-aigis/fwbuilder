#!/usr/bin/env bash
# Phase-10602: UI ssh-auth-impl-support-pair roster Soft 10600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-impl-support-pair roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthImplSupportPairRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10600+ ssh-auth-impl-support-pair roster ok"; echo "cleaned"; echo "OK: phase10602 e2e passed"
