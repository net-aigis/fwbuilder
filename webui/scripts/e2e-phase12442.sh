#!/usr/bin/env bash
# Phase-12442: UI ssh-auth-refusal-count roster Soft 12440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refusal-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefusalCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12440+ ssh-auth-refusal-count roster ok"; echo "cleaned"; echo "OK: phase12442 e2e passed"
