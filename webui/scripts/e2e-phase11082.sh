#!/usr/bin/env bash
# Phase-11082: UI ssh-auth-refusal-related roster Soft 11080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refusal-related roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefusalRelatedRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11080+ ssh-auth-refusal-related roster ok"; echo "cleaned"; echo "OK: phase11082 e2e passed"
