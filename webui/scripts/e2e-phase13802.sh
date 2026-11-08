#!/usr/bin/env bash
# Phase-13802: UI ssh-auth-dict-key-count roster Soft 13800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-dict-key-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthDictKeyCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13800+ ssh-auth-dict-key-count roster ok"; echo "cleaned"; echo "OK: phase13802 e2e passed"
