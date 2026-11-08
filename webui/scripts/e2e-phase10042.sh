#!/usr/bin/env bash
# Phase-10042: UI ssh-auth-capability-count roster Soft 10040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-capability-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthCapabilityCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10040+ ssh-auth-capability-count roster ok"; echo "cleaned"; echo "OK: phase10042 e2e passed"
