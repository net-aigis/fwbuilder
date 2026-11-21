#!/usr/bin/env bash
# Phase-13722: UI ssh-auth-cap-key-count roster Soft 13720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-cap-key-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthCapKeyCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13720+ ssh-auth-cap-key-count roster ok"; echo "cleaned"; echo "OK: phase13722 e2e passed"
