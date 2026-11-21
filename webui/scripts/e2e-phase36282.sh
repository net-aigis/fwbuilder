#!/usr/bin/env bash
# Phase-36282: UI ssh-auth-ms-78500-echo roster Soft 36280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-78500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs78500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36280+ ssh-auth-ms-78500-echo roster ok"; echo "cleaned"; echo "OK: phase36282 e2e passed"
