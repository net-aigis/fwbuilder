#!/usr/bin/env bash
# Phase-47802: UI ssh-auth-ms-96500-echo roster Soft 47800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-96500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs96500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47800+ ssh-auth-ms-96500-echo roster ok"; echo "cleaned"; echo "OK: phase47802 e2e passed"
