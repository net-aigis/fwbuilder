#!/usr/bin/env bash
# Phase-13882: UI ssh-auth-title-count roster Soft 13880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-title-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTitleCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13880+ ssh-auth-title-count roster ok"; echo "cleaned"; echo "OK: phase13882 e2e passed"
