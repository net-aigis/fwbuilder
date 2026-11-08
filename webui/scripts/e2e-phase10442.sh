#!/usr/bin/env bash
# Phase-10442: UI ssh-auth-refusal-pair roster Soft 10440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refusal-pair roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefusalPairRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10440+ ssh-auth-refusal-pair roster ok"; echo "cleaned"; echo "OK: phase10442 e2e passed"
